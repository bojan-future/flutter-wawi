import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'products_dao.g.dart';

@UseDao(tables: [Products])

/// products functionality extension for database
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
      throw RecordNotFoundException();
    } else {
      return productList.first;
    }
  }

  /// retrieves product with given uuid
  Future<Product> getProductByUuid(String uuid) async {
    return (select(products)..where((p) => p.uuid.equals(uuid)))
        .getSingleOrNull()
        .then((value) {
      if (value == null) {
        return Future.error(RecordNotFoundException());
      }
      return value;
    });
  }

  /// retrieves product with given GTIN
  Future<Product> getProductByGTIN(int gtin) async {
    final productList = await (select(products)
          ..where((p) =>
              p.gtin1.equals(gtin) |
              p.gtin2.equals(gtin) |
              p.gtin3.equals(gtin) |
              p.gtin4.equals(gtin) |
              p.gtin5.equals(gtin)))
        .get();

    if (productList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return productList.first;
    }
  }

  ///parses synchronization json object and returns ProductsCompanion for insert
  static ProductsCompanion companionFromSyncJson(
      Map<String, dynamic> json, String uuid) {
    return ProductsCompanion(
      uuid: Value(uuid),
      productNr: Value(json['number'] ?? ''),
      productName: Value(json['name'] ?? ''),
      gtin1: Value(int.parse(json['gtin'] ?? '0')),
      gtin2: Value(int.parse(json['gtin2'] ?? '0')),
      gtin3: Value(int.parse(json['gtin3'] ?? '0')),
      gtin4: Value(int.parse(json['gtin4'] ?? '0')),
      gtin5: Value(int.parse(json['gtin5'] ?? '0')),
      //todo: other fields
    );
  }
}
