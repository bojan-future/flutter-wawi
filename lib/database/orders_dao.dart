import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'orders_dao.g.dart';

@UseDao(tables: [Orders])

/// orders functionality extension for database
class OrdersDao extends DatabaseAccessor<Database> with _$OrdersDaoMixin {
  ///
  OrdersDao(Database db) : super(db);

  /// inserts given order into database
  Future<int> createOrder(OrdersCompanion order) {
    return into(orders).insert(order, mode: InsertMode.replace);
  }

  /// updates order in the database
  Future<bool> updateOrder(Order order) {
    return update(orders).replace(order);
  }

  /// deletes order from the database
  Future<int> deleteOrder(Order order) {
    return delete(orders).delete(order);
  }

  /// retrieves order with giver order number OR
  /// creates a new one if order with given number does not exist
  Future<Order> getOrderByNumber(String orderNumber) async {
    final orderList = await (select(orders)
          ..where((o) => o.orderNr.equals(orderNumber)))
        .get();

    if (orderList.isEmpty) {
      //insert new order with given order number and return it
      final newId =
          await createOrder(OrdersCompanion(orderNr: Value(orderNumber)));
      final newOrderList =
          await (select(orders)..where((o) => o.id.equals(newId))).get();
      return newOrderList.first;
    } else {
      return orderList.first;
    }
  }

  ///parses synchronization json object and returns OrdersCompanion for insert
  static OrdersCompanion companionFromSyncJson(
      Map<String, dynamic> json, String uuid) {
    return OrdersCompanion(
      uuid: Value(uuid),
      orderNr: Value(json['number']),
      //todo: other fields
    );
  }
}
  /// returns an order that has the requested barcode
  Future<int> getOrderByBarcode(String orderBarcode) async {
    final orderList = await (select(orders)
          ..where((o) => o.orderBarcode.equals(orderBarcode)))
        .get();

    if (orderList.isEmpty) {
      return Future.error(RecordNotFoundException());
    } else {
      return orderList.first.id;
    }
  }
}
