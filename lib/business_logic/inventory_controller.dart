import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import '../database/database.dart';
import 'packets_controller.dart';

/// Business Logic for Inventories
class InventoryController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// add inventory
  Future<int> addInventory() async {
    return database.inventoriesDao
        .createInventory(InventoriesCompanion(uuid: Value(Uuid().v4())));
  }

  /// add inventory position together with an associated packet
  Future<int> addInventoryPosition(String barcode, int inventoryID) async {
    Packet packet;
    try {
      packet = await PacketsController().getPacketByBarcode(barcode);
    } on RecordNotFoundException {
      var packetID = await PacketsController()
          .addPacket(barcode, createInexistingProduct: true);
      packet = await PacketsController().getPacketWithId(packetID);
    }

    var packetQuantity = packet.quantity;
    var packetID = packet.id;
    return database.inventoryPositionsDao.createInventoryPosition(
        InventoryPositionsCompanion(
            uuid: Value(Uuid().v4()),
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
