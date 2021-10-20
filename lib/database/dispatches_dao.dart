import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';
import 'synchronizable.dart';

part 'dispatches_dao.g.dart';

@UseDao(tables: [Dispatches])

/// packets functionality extension for database
class DispatchesDao extends DatabaseAccessor<Database>
    with _$DispatchesDaoMixin {
  ///
  DispatchesDao(Database db) : super(db);

  /// inserts given dispatch into database
  Future<String> createDispatch(DispatchesCompanion dispatch) {
    if (!dispatch.uuid.present) {
      dispatch = DispatchesCompanion(
        uuid: Value(Uuid().v4()),
        orderPositionID: dispatch.orderPositionID,
      );
    }
    return into(dispatches)
        .insert(dispatch, mode: InsertMode.replace)
        .then((value) {
      _getDispatchById(value).then(onUpdateData);
      return dispatch.uuid.value;
    });
  }

  /// updates dispatch in the database
  Future<bool> updateDispatch(Dispatch dispatch) {
    return update(dispatches).replace(dispatch).then((value) {
      if (value) {
        onUpdateData(dispatch);
      }
      return value;
    });
  }

  /// deletes dispatch from the database
  Future<int> deleteDispatch(Dispatch dispatch) {
    return delete(dispatches).delete(dispatch).then((value) {
      if (value > 0) {
        onDeleteData(dispatch);
      }
      return value;
    });
  }

  /// returns the dispatch that has the requested id.
  Future<Dispatch> _getDispatchById(int id) async {
    final dispatchList =
        await (select(dispatches)..where((o) => o.id.equals(id))).get();

    if (dispatchList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return dispatchList.first;
    }
  }

  /// returns the dispatch that has the requested id.
  Future<Dispatch> getDispatchByUuid(String uuid) async {
    final dispatchList =
        await (select(dispatches)..where((o) => o.uuid.equals(uuid))).get();

    if (dispatchList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return dispatchList.first;
    }
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(Dispatch model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();
    json['orderPosition'] = await db.orderPositionsDao
        .getOrderPositionByUuid(model.orderPositionID)
        .then((orderPos) => orderPos.uuid, onError: (e) => 'error');

    json.remove('orderID'); //do not polute server with internal informations

    addSynchroUpdate(model.uuid, SyncType.dispatch, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(Dispatch model) {
    addSynchroUpdate(model.uuid, SyncType.dispatch, model.toJsonString(),
        deleted: true);
  }
}
