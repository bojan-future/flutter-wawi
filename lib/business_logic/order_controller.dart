import '../database/database.dart';

/// Business Logic for Orders
class OrderController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// get id of the order position by barcode
  Future<int> getOrderPositionIdByBarcode(String barcode) async {
    return database.orderPositionsDao.getOrderPositionIdByBarcode(barcode);
  }

  /// retireves instance of order position with the given id
  Future<OrderPosition> getOrderPositionById(int orderPositionID) {
    return database.orderPositionsDao.getOrderPositionById(orderPositionID);
  }

  ///updates only fields present in the companion. field id must be present.
  Future<int> updateOrderPosition(
      OrderPositionsCompanion orderPositionsCompanion) {
    return database.orderPositionsDao
        .updateOrderPosition(orderPositionsCompanion);
  }
}
