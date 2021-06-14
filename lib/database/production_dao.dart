import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'production_dao.g.dart';

@UseDao(tables: [ProductionOrders, ProductionMaterials, ProductionResults])

///production functionality extension for database
class ProductionDao extends DatabaseAccessor<Database>
    with _$ProductionDaoMixin {
  ///
  ProductionDao(Database db) : super(db);

  /// inserts or updates production model and all its parts
  Future<void> writeProduction(ProductionModel production) async {
    return transaction(() async {
      await into(productionOrders).insertOnConflictUpdate(production.prodOrder);

      //upsert materials and results
      for (final mat in production.materials) {
        await into(productionMaterials).insertOnConflictUpdate(mat);
      }

      for (final res in production.results) {
        await into(productionResults).insertOnConflictUpdate(res);
      }
    });
  }

  /// returns a production that has the requested barcode
  Future<int> getProductionByBarcode(String prodBarcode) async {
    final productionList = await (select(productionOrders)
          ..where((o) => o.productionOrderBarcode.equals(prodBarcode)))
        .get();

    if (productionList.isEmpty) {
      return Future.error(RecordNotFoundException());
    } else {
      return productionList.first.id;
    }
  }
}
