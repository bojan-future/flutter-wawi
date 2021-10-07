import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'production_dao.g.dart';

@UseDao(tables: [ProductionOrders])

///production functionality extension for database
class ProductionDao extends DatabaseAccessor<Database>
    with _$ProductionDaoMixin {
  ///
  ProductionDao(Database db) : super(db);

  /// creates a new production model without materials or results
  Future<int> createProduction(
      ProductionOrdersCompanion productionOrder) async {
    return into(productionOrders)
        .insert(productionOrder, mode: InsertMode.replace);
  }

  /// returns a production with given id
  Future<ProductionOrder> getProductionById(int id) async {
    return (select(productionOrders)..where((o) => o.id.equals(id)))
        .getSingleOrNull()
        .then((value) {
      if (value != null) {
        return value;
      } else {
        return Future.error(RecordNotFoundException());
      }
    });
  }

  /// returns a production that has the requested barcode
  Future<int> getProductionIdByBarcode(String prodBarcode) async {
    final productionList = await (select(productionOrders)
          ..where((o) => o.productionOrderBarcode.equals(prodBarcode)))
        .get();

    if (productionList.isEmpty) {
      return Future.error(RecordNotFoundException());
    } else {
      return productionList.first.id;
    }
  }

  ///parses synchronization json object
  ///and returns ProductionOrdersCompanion for insert
  static ProductionOrdersCompanion companionFromSyncJson(
      Map<String, dynamic> json, String uuid) {
    return ProductionOrdersCompanion(
      uuid: Value(uuid),
      productionOrderNr: Value(json['productionOrderNr']),
      productionOrderBarcode: Value(json['productionOrderBarcode']),
      //todo: other fields
    );
  }

  /// deletes production with given uuid
  Future deleteProductionByUuid(String uuid) {
    return (delete(productionOrders)..where((o) => o.uuid.equals(uuid))).go();
  }
}
