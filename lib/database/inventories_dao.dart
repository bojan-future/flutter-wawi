import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';
import 'synchronizable.dart';

part 'inventories_dao.g.dart';

@UseDao(tables: [Inventories])

/// inventory functionality extension for database
class InventoriesDao extends DatabaseAccessor<Database>
    with _$InventoriesDaoMixin {
  ///
  InventoriesDao(Database db) : super(db);

  /// inserts given inventory into database
  Future<int> createInventory(InventoriesCompanion inventory) {
    if (!inventory.uuid.present) {
      inventory = InventoriesCompanion(
        uuid: Value(Uuid().v4()),
      );
    }
    return into(inventories).insert(inventory).then((value) {
      getInventory(value).then(onUpdateData);
      return value;
    });
  }

  /// retrieve record by id
  Future<Inventory> getInventory(int id) {
    return (select(inventories)..where((t) => t.id.equals(id))).getSingle();
  }

  /// updates inventory in the database
  Future<bool> updateInventory(Inventory inventory) {
    return update(inventories).replace(inventory).then((value) {
      if (value) {
        onUpdateData(inventory);
      }
      return value;
    });
  }

  /// deletes inventory from the database
  Future<int> deleteInventory(Inventory inventory) {
    return delete(inventories).delete(inventory).then((value) {
      if (value > 0) {
        onDeleteData(inventory);
      }
      return value;
    });
  }

  ///hook executed when record has been changed
  void onUpdateData(Inventory model) {
    addSynchroUpdate(model.uuid, SyncType.inventory, model.toJsonString());
  }

  ///hook executed when record has been deleted
  void onDeleteData(Inventory model) {
    addSynchroUpdate(model.uuid, SyncType.inventory, model.toJsonString(),
        deleted: true);
  }
}
