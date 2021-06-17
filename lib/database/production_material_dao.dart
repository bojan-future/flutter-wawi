import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'production_material_dao.g.dart';

@UseDao(tables: [ProductionMaterials])

/// packets functionality extension for database
class ProductionMaterialsDao extends DatabaseAccessor<Database>
    with _$ProductionMaterialsDaoMixin {
  ///
  ProductionMaterialsDao(Database db) : super(db);

  /// inserts given dispatch into database
  Future<int> createProductionMaterial(
      ProductionMaterialsCompanion productionMaterial) {
    return into(productionMaterials)
        .insert(productionMaterial, mode: InsertMode.replace);
  }

  /// updates dispatch in the database
  Future<bool> updateProductionMaterial(
      ProductionMaterialsCompanion productionMaterial) {
    return update(productionMaterials).replace(productionMaterial);
  }

  /// deletes dispatch from the database
  Future<int> deleteProductionMaterial(
      ProductionMaterialsCompanion productionMaterial) {
    return delete(productionMaterials).delete(productionMaterial);
  }

  /// retrieves dispatch with giver dispatch number OR
  Future<ProductionMaterial> getProductionMaterialByID(
      int productionMaterialID) async {
    final productionMaterialList = await (select(productionMaterials)
          ..where((o) => o.id.equals(productionMaterialID)))
        .get();

    if (productionMaterialList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return productionMaterialList.first;
    }
  }
}
