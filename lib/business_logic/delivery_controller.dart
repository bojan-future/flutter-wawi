import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../database/database.dart';
import 'auth_controller.dart';
import 'packets_controller.dart';

/// Business Logic for Packets
class DeliveryController {
  final database = DatabaseFactory.getDatabaseInstance();

  final BuildContext _context;
  late AuthController authController;
  late dynamic userID;

  DeliveryController(this._context) {
    authController = Provider.of<AuthController>(_context, listen: false);
    userID = authController.userID;
  }

  /// add delivery
  Future<int> addDelivery() async {
    return database.deliveriesDao
        .createDelivery(DeliveriesCompanion(user: Value(userID)));
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
