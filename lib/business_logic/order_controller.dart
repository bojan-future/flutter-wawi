/// Business Logic for Orders
class OrderController {
  /// get order by barcode
  Future<int> getOrderByBarcode(String barcode) async {
    var database;
    return database.ordersDao.getOrderByBarcode(barcode);
  }
}
