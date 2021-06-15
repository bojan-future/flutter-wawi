import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

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
    return into(productionResults)
        .insert(productionResult, mode: InsertMode.replace);
  }

  /// updates dispatch in the database
  Future<bool> updateProductionResult(
      ProductionResultsCompanion productionResult) {
    return update(productionResults).replace(productionResult);
  }

  /// deletes dispatch from the database
  Future<int> deleteProductionResult(
      ProductionResultsCompanion productionResult) {
    return delete(productionResults).delete(productionResult);
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
}
