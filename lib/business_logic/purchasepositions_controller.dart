import '../database/database.dart';

/// Business Logic for Purchases
class PurchasePositionsController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// get id of the purchase position by barcode
  Future<List<PurchasePosition>> getPurchasePositionsByProduct(
      String productUuid) async {
    return database.purchasePositionsDao
        .getPurchasePositionsByProduct(productUuid);
  }

  /// retireves instance of purchase position with the given id
  Future<PurchasePosition> getPurchasePositionByUuid(
      String purchasePositionUuid) {
    return database.purchasePositionsDao
        .getPurchasePositionByUuid(purchasePositionUuid);
  }

  ///updates only fields present in the companion. field id must be present.
  Future<int> updatePurchasePosition(
      PurchasePositionsCompanion purchasePositionsCompanion) {
    return database.purchasePositionsDao
        .updatePurchasePosition(purchasePositionsCompanion);
  }
}
