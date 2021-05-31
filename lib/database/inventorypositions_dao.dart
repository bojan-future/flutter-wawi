import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

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
    return into(inventoryPositions)
        .insert(inventoryPosition, mode: InsertMode.replace);
  }

  /// updates inventory position in the database
  Future<bool> updateInventoryPosition(
      InventoryPositionsCompanion inventoryPosition) {
    return update(inventoryPositions).replace(inventoryPosition);
  }

  /// deletes inventory position from the database
  Future<int> deleteInventoryPosition(
      InventoryPositionsCompanion inventoryPosition) {
    return delete(inventoryPositions).delete(inventoryPosition);
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
}
