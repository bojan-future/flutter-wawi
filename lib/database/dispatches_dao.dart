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
  Future<int> createDispatch(DispatchesCompanion dispatch) {
    if (!dispatch.uuid.present) {
      dispatch = DispatchesCompanion(
        uuid: Value(Uuid().v4()),
        orderID: dispatch.orderID,
      );
    }
    return into(dispatches).insert(dispatch).then((value) {
      getDispatchByID(value).then(onUpdateData);
      return value;
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
  Future<Dispatch> getDispatchByID(int id) async {
    final dispatchList =
        await (select(dispatches)..where((o) => o.id.equals(id))).get();

    if (dispatchList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return dispatchList.first;
    }
  }

  Future<void> onUpdateData(Dispatch model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();
    json['order'] = await db.ordersDao
        .getOrderById(model.orderID)
        .then((order) => order.uuid, onError: (e) => 'error');

    addSynchroUpdate(model.uuid, SyncType.dispatch, jsonEncode(json));
  }

  void onDeleteData(Dispatch model) {
    addSynchroUpdate(model.uuid, SyncType.dispatch, model.toJsonString(),
        deleted: true);
  }
}
