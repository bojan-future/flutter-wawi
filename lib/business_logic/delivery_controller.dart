import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'packets_controller.dart';

/// Business Logic for Packets
class DeliveryController {
  final database = DatabaseFactory.getDatabaseInstance();

  /// add delivery
  Future<int> addDelivery() async {
    return database.deliveriesDao.createDelivery(DeliveriesCompanion());
  }

  /// add delivery position together with an associated packet
  Future<int> addDeliveryPosition(String barcode, int deliveryID) async {
    int packetID = await PacketsController.addPacket(barcode);

    if (packetID == -1) {
      return packetID;
    } else {
      return database.deliveryPositionsDao.createDeliveryPosition(
          DeliveryPositionsCompanion(
              packet: Value(packetID), delivery: Value(deliveryID)));
    }
  }

  Future<DeliveryPosition> getDeliveryPosition(int deliveryPositionID) async {
    return database.deliveryPositionsDao
        .getDeliveryPositionByID(deliveryPositionID);
  }
}
