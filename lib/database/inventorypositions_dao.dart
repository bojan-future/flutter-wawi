import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';
import 'synchronizable.dart';

part 'inventorypositions_dao.g.dart';

@UseDao(tables: [InventoryPositions])

/// inventory positions functionality extension for database
class InventoryPositionsDao extends DatabaseAccessor<Database>
    with _$InventoryPositionsDaoMixin {
  ///
  InventoryPositionsDao(Database db) : super(db);

  /// inserts given inventory position into database
  Future<int> createInventoryPosition(
      InventoryPositionsCompanion inventoryPosition) {
    if (!inventoryPosition.uuid.present) {
      inventoryPosition = InventoryPositionsCompanion(
          uuid: Value(Uuid().v4()),
          inventory: inventoryPosition.inventory,
          quantity: inventoryPosition.quantity,
          packet: inventoryPosition.packet);
    }
    return into(inventoryPositions)
        .insert(inventoryPosition, mode: InsertMode.replace)
        .then((value) {
      getInventoryPositionByID(value).then(onUpdateData);
      return value;
    });
  }

  /// updates inventory position in the database
  Future<bool> updateInventoryPosition(InventoryPosition inventoryPosition) {
    return update(inventoryPositions).replace(inventoryPosition).then((value) {
      if (value) {
        onUpdateData(inventoryPosition);
      }
      return value;
    });
  }

  /// deletes inventory position from the database
  Future<int> deleteInventoryPosition(InventoryPosition inventoryPosition) {
    return delete(inventoryPositions).delete(inventoryPosition).then((value) {
      if (value > 0) {
        onDeleteData(inventoryPosition);
      }
      return value;
    });
  }

  /// retrieves inventory position with given ID
  Future<InventoryPosition> getInventoryPositionByID(
      int inventoryPositionID) async {
    final inventoryPositionList = await (select(inventoryPositions)
          ..where((o) => o.id.equals(inventoryPositionID)))
        .get();

    if (inventoryPositionList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return inventoryPositionList.first;
    }
  }

  Future<void> onUpdateData(InventoryPosition model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();

    json['inventory'] = await db.inventoriesDao
        .getInventory(model.inventory)
        .then((inventory) => inventory.uuid);

    json['packet'] = await db.packetsDao
        .getPacketWithId(model.packet)
        .then((packet) => packet.uuid, onError: (e) => 'error')
        .catchError((e) => 'error');

    addSynchroUpdate(
        model.uuid, SyncType.inventory_position, model.toJsonString());
  }

  void onDeleteData(InventoryPosition model) {
    addSynchroUpdate(
        model.uuid, SyncType.inventory_position, model.toJsonString(),
        deleted: true);
  }
}
