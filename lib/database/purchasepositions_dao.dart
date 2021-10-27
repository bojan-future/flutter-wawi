import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'purchasepositions_dao.g.dart';

@UseDao(tables: [PurchasePositions])

/// purchases functionality extension for database
class PurchasePositionsDao extends DatabaseAccessor<Database>
    with _$PurchasePositionsDaoMixin {
  ///
  PurchasePositionsDao(Database db) : super(db);

  /// inserts given purchase into database
  Future<int> createPurchasePosition(
      PurchasePositionsCompanion purchasePosition) {
    return into(purchasePositions)
        .insert(purchasePosition, mode: InsertMode.replace);
  }

  /// replaces purchase position in the database
  Future<bool> replacePurchasePosition(PurchasePosition purchasePosition) {
    return update(purchasePositions).replace(purchasePosition);
  }

  /// updates purchase position in the database
  Future<int> updatePurchasePosition(
      PurchasePositionsCompanion purchasePositionsCompanion) {
    return (update(purchasePositions)
          ..where((tbl) => tbl.id.equals(purchasePositionsCompanion.id.value)))
        .write(purchasePositionsCompanion);
  }

  /// deletes purchase from the database
  Future<int> deletePurchasePosition(PurchasePosition purchasePosition) {
    return delete(purchasePositions).delete(purchasePosition);
  }

  /// retrieves purchase with given id
  Future<PurchasePosition> getPurchasePositionByUuid(String uuid) {
    return (select(purchasePositions)..where((p) => p.uuid.equals(uuid)))
        .getSingleOrNull()
        .then((value) {
      if (value != null) {
        return value;
      } else {
        return Future.error(RecordNotFoundException());
      }
    });
  }

  Future<List<PurchasePosition>> getPurchasePositionsByProduct(
      String productUuid) {
    return (select(purchasePositions)
          ..where((p) => p.product.equals(productUuid)))
        .get();
  }

  ///parses synchronization json object and returns PurchasesCompanion for insert
  static Future<PurchasePositionsCompanion> companionFromSyncJson(
      Map<String, dynamic> json, String uuid) async {
    var db = DatabaseFactory.getDatabaseInstance();
    if (json['product'] == "") {
      throw InvalidDataException("Ungültige Daten vom Server empfangen.");
    }
    var product =
        await db.productsDao.getProductByUuidCreateIfMissing(json['product']);

    return PurchasePositionsCompanion(
        uuid: Value(uuid),
        originalQuantity: Value(double.parse(json['originalQuantity'])),
        restQuantity: Value(double.parse(json['restQuantity'])),
        product: Value(product.uuid));
  }

  /// deletes purchaseposition with given uuid
  Future deletePurchasePositionByUuid(String uuid) {
    return (delete(purchasePositions)..where((o) => o.uuid.equals(uuid))).go();
  }
}
