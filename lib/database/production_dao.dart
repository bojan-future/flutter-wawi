import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'production_dao.g.dart';

@UseDao(tables: [ProductionOrders, ProductionMaterials, ProductionResults])

///production functionality extension for database
class ProductionDao extends DatabaseAccessor<Database>
    with _$ProductionDaoMixin {
  ///
  ProductionDao(Database db) : super(db);

  /// creates a new production model without materials or results
  Future<ProductionModel> createProduction(String productionOrderNr) async {
    final id =
        await into(productionOrders).insert(const ProductionOrdersCompanion());
    final productionOrder =
        ProductionOrder(id: id, productionOrderNr: productionOrderNr);

    // production order without materials and results
    return ProductionModel(productionOrder, [], []);
  }

  /// inserts or updates production model and all its parts
  Future<void> writeProduction(ProductionModel production) async {
    return transaction(() async {
      await into(productionOrders).insertOnConflictUpdate(production.prodOrder);

      //in case some of materials have been removed from the production model
      await _deleteMaterialsNotInProductionModel(production);

      //in case some of results have been removed from the production model
      await _deleteResultsNotInProductionModel(production);

      //upsert materials and results
      for (final mat in production.materials) {
        await into(productionMaterials).insertOnConflictUpdate(mat);
      }

      for (final res in production.results) {
        await into(productionResults).insertOnConflictUpdate(res);
      }
    });
  }

  Future<void> _deleteResultsNotInProductionModel(
      ProductionModel production) async {
    final resultIds = production.results.map((e) => e.id).toList();
    await (delete(productionResults)
          ..where((res) =>
              res.order.equals(production.prodOrder.id) &
              res.id.isNotIn(resultIds)))
        .go();
  }

  Future<void> _deleteMaterialsNotInProductionModel(
      ProductionModel production) async {
    final materialIds = production.materials.map((e) => e.id).toList();
    await (delete(productionMaterials)
          ..where((mat) =>
              mat.order.equals(production.prodOrder.id) &
              mat.id.isNotIn(materialIds)))
        .go();
  }
}
