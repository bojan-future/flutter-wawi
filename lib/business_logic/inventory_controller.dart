import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import '../database/database.dart';
import 'packets_controller.dart';

/// Business Logic for Inventories
class InventoryController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// add inventory
  Future<String> addInventory() async {
    return database.inventoriesDao
        .createInventory(InventoriesCompanion(uuid: Value(Uuid().v4())));
  }

  /// add inventory position together with an associated packet
  Future<String> addInventoryPosition(
      String barcode, String inventoryID) async {
    Packet packet;
    try {
      packet = await PacketsController().getPacketByBarcode(barcode);
    } on RecordNotFoundException {
      var packetUuid = await PacketsController()
          .addPacket(barcode, createInexistingProduct: true);
      packet = await PacketsController().getPacketByUuid(packetUuid);
    }

    var packetQuantity = packet.quantity;
    var packetID = packet.uuid;
    return database.inventoryPositionsDao.createInventoryPosition(
        InventoryPositionsCompanion(
            uuid: Value(Uuid().v4()),
            packet: Value(packetID),
            inventory: Value(inventoryID),
            quantity: Value(packetQuantity)));
  }

  /// get inventory position
  Future<InventoryPosition> getInventoryPosition(
      String inventoryPositionUuid) async {
    return database.inventoryPositionsDao
        .getInventoryPositionByUuid(inventoryPositionUuid);
  }
}
