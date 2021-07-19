import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';
import 'synchronizable.dart';

part 'production_result_dao.g.dart';

@UseDao(tables: [ProductionResults])

/// packets functionality extension for database
class ProductionResultsDao extends DatabaseAccessor<Database>
    with _$ProductionResultsDaoMixin {
  ///
  ProductionResultsDao(Database db) : super(db);

  /// inserts given dispatch into database
  Future<int> createProductionResult(
      ProductionResultsCompanion productionResult) {
    if (!productionResult.uuid.present) {
      productionResult = ProductionResultsCompanion(
        uuid: Value(Uuid().v4()),
        prodOrder: productionResult.prodOrder,
        packet: productionResult.packet,
      );
    }
    return into(productionResults)
        .insert(productionResult, mode: InsertMode.replace)
        .then((value) {
      getProductionResultByID(value).then(onUpdateData);
      return value;
    });
  }

  /// updates dispatch in the database
  Future<bool> updateProductionResult(ProductionResult productionResult) {
    return update(productionResults).replace(productionResult).then((value) {
      if (value) {
        onUpdateData(productionResult);
      }
      return value;
    });
  }

  /// deletes dispatch from the database
  Future<int> deleteProductionResult(ProductionResult productionResult) {
    return delete(productionResults).delete(productionResult).then((value) {
      if (value > 0) {
        onDeleteData(productionResult);
      }
      return value;
    });
  }

  /// retrieves dispatch with giver dispatch number OR
  Future<ProductionResult> getProductionResultByID(
      int productionResultID) async {
    final productionResultList = await (select(productionResults)
          ..where((o) => o.id.equals(productionResultID)))
        .get();

    if (productionResultList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return productionResultList.first;
    }
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(ProductionResult model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();

    await db.productionDao.getProductionById(model.prodOrder).then((prodOrder) {
      json['prodOrder'] = prodOrder.uuid;
      json['prodOrderBarcode'] = prodOrder.productionOrderBarcode;
    }).catchError((e) {
      json['prodOrder'] = 'error';
      json['prodOrderBarcode'] = 'error';
    });

    await db.packetsDao.getPacketWithId(model.packet).then((packet) {
      json['packet'] = packet.uuid;
      json['packetBarcode'] = packet.barcode;
    }).catchError((e) {
      json['packet'] = 'error';
      json['packetBarcode'] = 'error';
    });

    addSynchroUpdate(model.uuid, SyncType.production_result, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(ProductionResult model) {
    addSynchroUpdate(
        model.uuid, SyncType.production_result, model.toJsonString(),
        deleted: true);
  }
}
