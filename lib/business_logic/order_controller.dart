import '../database/database.dart';

/// Business Logic for Orders
class OrderController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// get order by barcode
  Future<int> getOrderByBarcode(String barcode) async {
    return database.ordersDao.getOrderByBarcode(barcode);
  }
}
