import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';
import 'synchronizable.dart';

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
    if (!productionMaterial.uuid.present) {
      productionMaterial = ProductionMaterialsCompanion(
        uuid: Value(Uuid().v4()),
        prodOrder: productionMaterial.prodOrder,
        packet: productionMaterial.packet,
      );
    }
    return into(productionMaterials)
        .insert(productionMaterial, mode: InsertMode.replace)
        .then((value) {
      getProductionMaterialByID(value).then(onUpdateData);
      return value;
    });
    ;
  }

  /// updates dispatch in the database
  Future<bool> updateProductionMaterial(ProductionMaterial productionMaterial) {
    return update(productionMaterials)
        .replace(productionMaterial)
        .then((value) {
      if (value) {
        onUpdateData(productionMaterial);
      }
      return value;
    });
  }

  /// deletes dispatch from the database
  Future<int> deleteProductionMaterial(ProductionMaterial productionMaterial) {
    return delete(productionMaterials).delete(productionMaterial).then((value) {
      if (value > 0) {
        onDeleteData(productionMaterial);
      }
      return value;
    });
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

  void onUpdateData(ProductionMaterial model) {
    addSynchroUpdate(
        model.uuid, SyncType.production_material, model.toJsonString());
  }

  void onDeleteData(ProductionMaterial model) {
    addSynchroUpdate(
        model.uuid, SyncType.production_material, model.toJsonString(),
        deleted: true);
  }
}
