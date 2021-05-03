import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'products_dao.g.dart';

@UseDao(tables: [Products])

/// packets functionality extension for database
class ProductsDao extends DatabaseAccessor<Database> with _$ProductsDaoMixin {
  ///
  ProductsDao(Database db) : super(db);

  /// inserts given product into database
  Future<int> createProduct(ProductsCompanion product) {
    return into(products).insert(product, mode: InsertMode.replace);
  }

  /// updates product in the database
  Future<bool> updateProduct(Product product) {
    return update(products).replace(product);
  }

  /// deletes product from the database
  Future<int> deleteProduct(Product product) {
    return delete(products).delete(product);
  }

  /// retrieves product with given product number
  Future<Product> getProductByNumber(String productNumber) async {
    final productList = await (select(products)
          ..where((p) => p.productNr.equals(productNumber)))
        .get();

    if (productList.isEmpty) {
      //insert new product with given product number and return it
      final newId = await createProduct(
          ProductsCompanion(productNr: Value(productNumber)));
      final newProductList =
          await (select(products)..where((p) => p.id.equals(newId))).get();
      return newProductList.first;
    } else {
      return productList.first;
    }
  }

  /// retrieves product with given GTIN
  Future<Product> getProductByGTIN(int gtin) async {
    final productList = await (select(products)
          ..where((p) => p.gtin1.equals(gtin))
          ..where((p) => p.gtin2.equals(gtin))
          ..where((p) => p.gtin3.equals(gtin))
          ..where((p) => p.gtin4.equals(gtin))
          ..where((p) => p.gtin5.equals(gtin)))
        .get();

    if (productList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return productList.first;
    }
  }
}
