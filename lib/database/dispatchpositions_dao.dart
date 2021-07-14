import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';
import 'synchronizable.dart';

part 'dispatchpositions_dao.g.dart';

@UseDao(tables: [DispatchPositions])

/// packets functionality extension for database
class DispatchPositionsDao extends DatabaseAccessor<Database>
    with _$DispatchPositionsDaoMixin {
  ///
  DispatchPositionsDao(Database db) : super(db);

  /// inserts given dispatch into database
  Future<int> createDispatchPosition(
      DispatchPositionsCompanion dispatchPosition) {
    if (!dispatchPosition.uuid.present) {
      dispatchPosition = DispatchPositionsCompanion(
        uuid: Value(Uuid().v4()),
        dispatch: dispatchPosition.dispatch,
        packet: dispatchPosition.packet,
      );
    }
    return into(dispatchPositions)
        .insert(dispatchPosition, mode: InsertMode.replace)
        .then((value) {
      getDispatchPositionByID(value).then(onUpdateData);
      return value;
    });
  }

  /// updates dispatch in the database
  Future<bool> updateDispatchPosition(DispatchPosition dispatchPosition) {
    return update(dispatchPositions).replace(dispatchPosition).then((value) {
      if (value) {
        onUpdateData(dispatchPosition);
      }
      return value;
    });
  }

  /// deletes dispatch from the database
  Future<int> deleteDispatchPosition(DispatchPosition dispatchPosition) {
    return delete(dispatchPositions).delete(dispatchPosition).then((value) {
      if (value > 0) {
        onDeleteData(dispatchPosition);
      }
      return value;
    });
  }

  /// retrieves dispatch with giver dispatch number OR
  Future<DispatchPosition> getDispatchPositionByID(
      int dispatchPositionID) async {
    final dispatchPositionList = await (select(dispatchPositions)
          ..where((o) => o.id.equals(dispatchPositionID)))
        .get();

    if (dispatchPositionList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return dispatchPositionList.first;
    }
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(DispatchPosition model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();

    var dispatch = await db.dispatchesDao.getDispatchByID(model.dispatch);

    json['dispatch'] = dispatch.uuid;

    json['orderBarcode'] = await db.ordersDao
        .getOrderById(dispatch.orderID)
        .then((order) => order.orderBarcode);

    json['packet'] = await db.packetsDao
        .getPacketWithId(model.packet)
        .then((packet) => packet.uuid, onError: (e) => 'error')
        .catchError((e) => 'error');

    addSynchroUpdate(model.uuid, SyncType.dispatch_position, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(DispatchPosition model) {
    addSynchroUpdate(
        model.uuid, SyncType.dispatch_position, model.toJsonString(),
        deleted: true);
  }
}
