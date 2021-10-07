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

  /// retrieves product with given id
  Future<Product> getProductById(int productId) {
    return (select(products)..where((p) => p.id.equals(productId)))
        .getSingleOrNull()
        .then((value) {
      if (value == null) {
        return Future.error(RecordNotFoundException());
      }
      return value;
    });
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
              (p.gtin1 / Variable(10)).equals(gtin) |
              (p.gtin2 / Variable(10)).equals(gtin) |
              (p.gtin3 / Variable(10)).equals(gtin) |
              (p.gtin4 / Variable(10)).equals(gtin) |
              (p.gtin5 / Variable(10)).equals(gtin)))
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
      productNr: Value(json['productNr'] ?? ''),
      productName: Value(json['productName'] ?? ''),
      gtin1: Value(int.tryParse(json['gtin1'] ?? '0') ?? 0),
      gtin2: Value(int.tryParse(json['gtin2'] ?? '0') ?? 0),
      gtin3: Value(int.tryParse(json['gtin3'] ?? '0') ?? 0),
      gtin4: Value(int.tryParse(json['gtin4'] ?? '0') ?? 0),
      gtin5: Value(int.tryParse(json['gtin5'] ?? '0') ?? 0),
      //todo: other fields
    );
  }

  /// deletes product with given uuid
  Future deleteProductByUuid(String uuid) {
    return (delete(products)..where((p) => p.uuid.equals(uuid))).go();
  }
}
