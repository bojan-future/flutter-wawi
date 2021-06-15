import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'production_dao.g.dart';

@UseDao(tables: [ProductionOrders])

///production functionality extension for database
class ProductionDao extends DatabaseAccessor<Database>
    with _$ProductionDaoMixin {
  ///
  ProductionDao(Database db) : super(db);

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
