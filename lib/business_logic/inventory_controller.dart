import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'packets_controller.dart';

/// Business Logic for Inventories
class InventoryController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// add inventory
  Future<int> addInventory() async {
    return database.inventoriesDao.createInventory(InventoriesCompanion());
  }

  /// add inventory position together with an associated packet
  Future<int> addInventoryPosition(String barcode, int inventoryID) async {
    Packet packet;
    try {
      packet = await PacketsController().getPacketByBarcode(barcode);
      // ignore: avoid_catching_errors
    } on StateError {
      var packetID = await PacketsController().addPacket(barcode);
      packet = await PacketsController().getPacketWithId(packetID);
    }

    var packetQuantity = packet.quantity;
    var packetID = packet.id;
    return database.inventoryPositionsDao.createInventoryPosition(
        InventoryPositionsCompanion(
            packet: Value(packetID),
            inventory: Value(inventoryID),
            quantity: Value(packetQuantity)));
  }

  /// get inventory position
  Future<InventoryPosition> getInventoryPosition(
      int inventoryPositionID) async {
    return database.inventoryPositionsDao
        .getInventoryPositionByID(inventoryPositionID);
  }
}
