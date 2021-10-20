import 'dart:convert';

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
  Future<String> createProductionMaterial(
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
      _getProductionMaterialById(value).then(onUpdateData);
      return productionMaterial.uuid.value;
    });
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

  /// retrieves ProductionMaterial with given id
  Future<ProductionMaterial> _getProductionMaterialById(
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

  /// retrieves ProductionMaterial with given uuid
  Future<ProductionMaterial> getProductionMaterialByUuid(String uuid) async {
    final productionMaterialList = await (select(productionMaterials)
          ..where((o) => o.uuid.equals(uuid)))
        .get();

    if (productionMaterialList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return productionMaterialList.first;
    }
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(ProductionMaterial model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();

    await db.productionDao
        .getProductionByUuid(model.prodOrder)
        .then((prodOrder) {
      json['prodOrder'] = prodOrder.uuid;
      json['prodOrderBarcode'] = prodOrder.productionOrderBarcode;
    }).catchError((e) {
      json['prodOrder'] = 'error';
      json['prodOrderBarcode'] = 'error';
    });

    await db.packetsDao.getPacketByUuid(model.packet).then((packet) {
      json['packet'] = packet.uuid;
      json['packetBarcode'] = packet.barcode;
    }).catchError((e) {
      json['packet'] = 'error';
      json['packetBarcode'] = 'error';
    });

    addSynchroUpdate(
        model.uuid, SyncType.production_material, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(ProductionMaterial model) {
    addSynchroUpdate(
        model.uuid, SyncType.production_material, model.toJsonString(),
        deleted: true);
  }
}
