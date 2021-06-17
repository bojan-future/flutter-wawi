import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:kuda_lager/business_logic/packets_controller.dart';
import 'package:kuda_lager/database/products_dao.dart';
import 'package:kuda_lager/main.dart';
import '../database/database.dart';

class SynchroController {
  Database database;

  ///default constructor
  SynchroController() : database = DatabaseFactory.getDatabaseInstance() {}

  Future<void> synchronize() async {
    _syncDown();

    //todo: syncUp
  }

  Future<SyncResponse> _fetchSync(lastid) async {
    final response = await http.get(Uri.parse(
        "http://ffsync-test.futurefactory-software.com/syncs?lic=AAAA-AAAA-AAAA-AAAA&last_id=$lastid"));

    if (response.statusCode == 200) {
      var body = response.body.replaceAll(r"\r", "").replaceAll(r"\n", "");

      return SyncResponse.fromJson(jsonDecode(body));
    } else {
      throw Exception('Synchronization error');
    }
  }

  void _syncDown() async {
    var lastid =
        int.tryParse(await database.systemVariablesDao.get('lastid')) ?? 0;
    var syncResponse = await _fetchSync(lastid);
    var highestid = lastid;
    if (syncResponse.success) {
      for (var sync in syncResponse.syncs) {
        _updateDatabase(sync);
        highestid = max(highestid, sync.id ?? 0);
      }
    }
    database.systemVariablesDao.set('lastid', highestid.toString());
  }

  void _updateDatabase(Sync sync) {
    switch (sync.type) {
      case SyncType.product:
        database.productsDao.createProduct(
            ProductsDao.companionFromSyncJson(sync.data, sync.uuid));
        break;
      //todo: other tables
      default:
    }

    //todo: resolve unresolved links
    //idee: fehlende datensätze anlegen (wir haben ja die uuids), mit dummy-daten
  }
}

///enum-like class for type mapping
class SyncType {
  static const int product = 90;
  static const int order = 152;
  static const int dispatch = 154;
  static const int production = 170;
  static const int delivery = 187;
}

class SyncResponse {
  final bool success;
  final List<Sync> syncs;

  ///default constructor
  SyncResponse({required this.success, required this.syncs});

  factory SyncResponse.fromJson(Map<String, dynamic> json) {
    List<dynamic> syncs_raw = json['syncs'];
    return SyncResponse(
        success: json['success'],
        syncs: syncs_raw.map((json) => Sync.fromJson(json)).toList());
  }
}

class Sync {
  final int? id;
  final String uuid;
  final String? lic;
  final String? userid;
  final String? source;
  final int type;
  final bool deleted;
  final Map<String, dynamic> data; //json

  ///default constructor
  Sync(
      {this.id,
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
