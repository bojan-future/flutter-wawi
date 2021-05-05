import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'inventories_dao.g.dart';

@UseDao(tables: [Inventories])

/// inventory functionality extension for database
class InventoriesDao extends DatabaseAccessor<Database>
    with _$InventoriesDaoMixin {
  ///
  InventoriesDao(Database db) : super(db);

  /// inserts given inventory into database
  Future<int> createInventory(InventoriesCompanion inventory) {
    return into(inventories).insert(inventory);
  }

  /// updates inventory in the database
  Future<bool> updateInventory(Inventory inventory) {
    return update(inventories).replace(inventory);
  }

  /// deletes inventory from the database
  Future<int> deleteInventory(Inventory inventory) {
    return delete(inventories).delete(inventory);
  }
}
