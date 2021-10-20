import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';
import 'synchronizable.dart';

part 'deliverypositions_dao.g.dart';

@UseDao(tables: [DeliveryPositions])

/// delivery positions functionality extension for database
class DeliveryPositionsDao extends DatabaseAccessor<Database>
    with _$DeliveryPositionsDaoMixin {
  ///
  DeliveryPositionsDao(Database db) : super(db);

  /// inserts given delivery position into database
  Future<String> createDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    if (!deliveryPosition.uuid.present) {
      deliveryPosition = DeliveryPositionsCompanion(
        uuid: Value(Uuid().v4()),
        packet: deliveryPosition.packet,
        delivery: deliveryPosition.delivery,
      );
    }
    return into(deliveryPositions)
        .insert(deliveryPosition, mode: InsertMode.replace)
        .then((value) {
      _getDeliveryPositionByID(value).then(onUpdateData);

      return deliveryPosition.uuid.value;
    });
  }

  /// updates delivery position in the database
  Future<bool> updateDeliveryPosition(DeliveryPosition deliveryPosition) {
    return update(deliveryPositions).replace(deliveryPosition).then((value) {
      if (value) {
        onUpdateData(deliveryPosition);
      }
      return value;
    });
  }

  /// deletes delivery position from the database
  Future<int> deleteDeliveryPosition(DeliveryPosition deliveryPosition) {
    return delete(deliveryPositions).delete(deliveryPosition).then((value) {
      if (value > 0) {
        onDeleteData(deliveryPosition);
      }
      return value;
    });
  }

  /// retrieves delivery position with given ID
  Future<DeliveryPosition> _getDeliveryPositionByID(
      int deliveryPositionID) async {
    final deliveryPositionList = await (select(deliveryPositions)
          ..where((o) => o.id.equals(deliveryPositionID)))
        .get();

    if (deliveryPositionList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return deliveryPositionList.first;
    }
  }

  /// retrieves delivery position with given ID
  Future<DeliveryPosition> getDeliveryPositionByUuid(String uuid) async {
    final deliveryPositionList = await (select(deliveryPositions)
          ..where((o) => o.uuid.equals(uuid)))
        .get();

    if (deliveryPositionList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return deliveryPositionList.first;
    }
  }

  Future<bool> checkDeliveryPositionByPacket(String packetUuid) async {
    final deliveryPositionList = await (select(deliveryPositions)
          ..where((o) => o.packet.equals(packetUuid)))
        .get();

    if (deliveryPositionList.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(DeliveryPosition model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();
    json['delivery'] = await db.deliveriesDao
        .getDeliveryByUuid(model.delivery)
        .then((delivery) => delivery.uuid);

    await db.packetsDao.getPacketByUuid(model.packet).then((packet) {
      json['packet'] = packet.uuid;
      json['packetBarcode'] = packet.barcode;
    }).catchError((e) {
      json['packet'] = 'error';
      json['packetBarcode'] = 'error';
    });

    addSynchroUpdate(model.uuid, SyncType.delivery_position, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(DeliveryPosition model) {
    addSynchroUpdate(
        model.uuid, SyncType.delivery_position, model.toJsonString(),
        deleted: true);
  }
}
