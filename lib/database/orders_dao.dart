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

  /// retrieves order with given id
  Future<Order> getOrderById(int id) {
    return (select(orders)..where((o) => o.id.equals(id)))
        .getSingleOrNull()
        .then((value) {
      if (value != null) {
        return value;
      } else {
        return Future.error(RecordNotFoundException());
      }
    });
  }

  /// retrieves order with given order number
  Future<Order> getOrderByNumber(String orderNumber) async {
    return (select(orders)..where((o) => o.orderNr.equals(orderNumber)))
        .getSingleOrNull()
        .then((value) {
      if (value != null) {
        return value;
      } else {
        return Future.error(RecordNotFoundException());
      }
    });
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

  ///parses synchronization json object and returns OrdersCompanion for insert
  static OrdersCompanion companionFromSyncJson(
      Map<String, dynamic> json, String uuid) {
    return OrdersCompanion(
      uuid: Value(uuid),
      orderNr: Value(json['orderNr']),
      orderBarcode: Value(json['orderBarcode']),
    );
  }

  /// deletes order with given uuid
  Future deleteOrderByUuid(String uuid) {
    return (delete(orders)..where((o) => o.uuid.equals(uuid))).go();
  }
}
