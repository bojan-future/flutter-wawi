import '../database/database.dart';

/// Business Logic for Orders
class OrderPositionsController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// get id of the order position by barcode
  Future<String> getOrderPositionUuidByBarcode(String barcode) async {
    return database.orderPositionsDao.getOrderPositionUuidByBarcode(barcode);
  }

  /// retireves instance of order position with the given id
  Future<OrderPosition> getOrderPositionByUuid(String orderPositionUuid) {
    return database.orderPositionsDao.getOrderPositionByUuid(orderPositionUuid);
  }

  ///updates only fields present in the companion. field id must be present.
  Future<int> updateOrderPosition(
      OrderPositionsCompanion orderPositionsCompanion) {
    return database.orderPositionsDao
        .updateOrderPosition(orderPositionsCompanion);
  }
}
