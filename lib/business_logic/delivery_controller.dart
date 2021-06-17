import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../database/database.dart';
import 'auth_controller.dart';
import 'packets_controller.dart';

/// Business Logic for Deliveries
class DeliveryController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  final BuildContext _context;
  late AuthController authController;
  late dynamic userID;

  DeliveryController(this._context) {
    authController = Provider.of<AuthController>(_context, listen: false);
    userID = authController.getUserId();
  }

  /// add delivery
  Future<int> addDelivery() async {
    return database.deliveriesDao
        .createDelivery(DeliveriesCompanion(user: Value(userID)));
  }

  /// add delivery position together with an associated packet
  Future<int> addDeliveryPosition(String barcode, int deliveryID) async {
    var packetID = await PacketsController().addPacket(barcode);

    return database.deliveryPositionsDao
        .createDeliveryPosition(DeliveryPositionsCompanion(
      uuid: Value(Uuid().v4()),
      packet: Value(packetID),
      delivery: Value(deliveryID),
    ));
  }

  /// get delivery position
  Future<DeliveryPosition> getDeliveryPosition(int deliveryPositionID) async {
    return database.deliveryPositionsDao
        .getDeliveryPositionByID(deliveryPositionID);
  }
}
