import 'dart:convert';
import 'dart:math';

import 'package:cron/cron.dart';
import 'package:http/http.dart' as http;

import '../database/database.dart';
import '../database/orders_dao.dart';
import '../database/production_dao.dart';
import '../database/products_dao.dart';
import '../database/synchronizable.dart';

///
class SynchroController {
  final Database _database;
  final Cron _cron;
  bool _syncInProgress = false;

  ///default constructor
  SynchroController()
      : _database = DatabaseFactory.getDatabaseInstance(),
        _cron = Cron();

  /// starts scheduled synchronization (every 3 minutes)
  void initSchedule() {
    _cron.schedule(Schedule.parse('*/3 * * * *'), synchronize);
  }

  /// synchronize local database with the server
  Future<void> synchronize() async {
    if (_syncInProgress) return;
    _syncInProgress = true;
    _syncDown();

    _syncUp();
    _syncInProgress = false;
  }

  Future<SyncResponse> _fetchSync(int lastid) async {
    final response = await http.get(Uri.parse(
        "http://ffsync-test.futurefactory-software.com/syncs?lic=AAAA-AAAA-AAAA-AAAA&last_id=$lastid"));

    if (response.statusCode == 200) {
      var body = response.body.replaceAll(r"\r", "").replaceAll(r"\n", "");

      return SyncResponse.fromJson(jsonDecode(body));
    } else {
      throw Exception('Synchronization error');
    }
  }

  bool _isResponseOk(http.Response response) =>
      (response.statusCode >= 200 && response.statusCode <= 299);

  Future<bool> _uploadSync(SynchroUpdate synchroUpdate) async {
    var body = synchroUpdate.toMap();

    //todo: add lic, source and userid to the body
    body['lic'] = 'AAAA-AAAA-AAAA-AAAA';
    body['source'] = 'kuda-lager-app';
    body['userid'] = 'bojan';

    var url = Uri.parse(
        "http://ffsync-test.futurefactory-software.com/syncs/${synchroUpdate.uuid}");

    if (synchroUpdate.deleted == false) {
      return http
          .put(url, body: body)
          .then(_isResponseOk, onError: (e) => false);
    } else //deleted == true
    {
      return http
          .delete(url, body: body)
          .then(_isResponseOk, onError: (e) => false);
    }
  }

  void _syncUp() async {
    var doTry = true;
    while (doTry) {
      doTry = await _database.synchroUpdatesDao.getNext().then(
          (synchroUpdate) async {
        var success = await _uploadSync(synchroUpdate);
        if (success) {
          _database.synchroUpdatesDao.remove(synchroUpdate.id);
        }
        return true; //try next one
      }, onError: (e) {
        //on database error -> stop
        // simplified version
        // - assuming only error is if there are no synchroUpdates left
        return false;
      });
    }
  }

  void _syncDown() async {
    var lastid =
        int.tryParse(await _database.systemVariablesDao.get('lastid')) ?? 0;
    lastid = 0;
    var syncResponse = await _fetchSync(lastid);
    var highestid = lastid;
    if (syncResponse.success) {
      for (var sync in syncResponse.syncs) {
        _updateDatabase(sync);
        highestid = max(highestid, sync.id);
      }
    }
    _database.systemVariablesDao.set('lastid', highestid.toString());
  }

  void _updateDatabase(Sync sync) {
    switch (sync.type) {
      case SyncType.product:
        _database.productsDao.createProduct(
            ProductsDao.companionFromSyncJson(sync.data, sync.uuid));
        break;
      case SyncType.order:
        _database.ordersDao
            .createOrder(OrdersDao.companionFromSyncJson(sync.data, sync.uuid));
        break;
      case SyncType.production:
        _database.productionDao.createProduction(
            ProductionDao.companionFromSyncJson(sync.data, sync.uuid));
        break;
      //todo: other tables
      default:
    }

    /// remove synchro entry for this record to prevent uploading older version
    _database.synchroUpdatesDao.removeByUuid(sync.uuid);
  }
}

/// represents answer from the server, containing synchronization packets
class SyncResponse {
  /// was call successfull
  final bool success;

  /// list of synchronization packets
  final List<Sync> syncs;

  ///default constructor
  SyncResponse({required this.success, required this.syncs});

  /// creates SyncResponse from raw JSON
  factory SyncResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> syncsRaw = json['syncs'];
    return SyncResponse(
        success: json['success'],
        syncs: syncsRaw.map((json) => Sync.fromJson(json)).toList());
  }
}

/// Represents incoming Synchronization Packet
class Sync {
  /// synchronization id
  final int id;

  /// record uuid
  final String uuid;

  /// customer licence
  final String? lic;

  /// user identification
  final String? userid;

  /// source identification
  final String? source;

  /// record type (same as table number in Future Factory)
  final int type;

  /// true if record is to be deleted
  final bool deleted;

  /// record detail data
  final Map<String, dynamic> data; //json

  ///default constructor
  Sync(
      {required this.id,
      required this.uuid,
      this.lic,
      this.userid,
      this.source,
      required this.type,
      this.deleted = false,
      required this.data});

  ///make Sync instance from json object
  factory Sync.fromJson(Map<String, dynamic> json) {
    return Sync(
      id: int.parse(json['id']),
      uuid: json['uuid'],
      lic: json['lic'],
      userid: json['uuid'],
      source: json['source'],
      type: int.parse(json['type']),
      deleted: int.parse(json['deleted']) == 0 ? false : true,
      data: jsonDecode(json['data'].isEmpty ? '{}' : json['data']),
    );
  }
}
