import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'orderpositions_dao.g.dart';

@UseDao(tables: [OrderPositions])

/// orders functionality extension for database
class OrderPositionsDao extends DatabaseAccessor<Database>
    with _$OrderPositionsDaoMixin {
  ///
  OrderPositionsDao(Database db) : super(db);

  /// inserts given order into database
  Future<int> createOrderPosition(OrderPositionsCompanion orderPosition) {
    return into(orderPositions).insert(orderPosition, mode: InsertMode.replace);
  }

  /// replaces order position in the database
  Future<bool> replaceOrderPosition(OrderPosition orderPosition) {
    return update(orderPositions).replace(orderPosition);
  }

  /// updates order position in the database
  Future<int> updateOrderPosition(
      OrderPositionsCompanion orderPositionsCompanion) {
    return (update(orderPositions)
          ..where((tbl) => tbl.id.equals(orderPositionsCompanion.id.value)))
        .write(orderPositionsCompanion);
  }

  /// deletes order from the database
  Future<int> deleteOrderPosition(OrderPosition orderPosition) {
    return delete(orderPositions).delete(orderPosition);
  }

  /// retrieves order with given id
  Future<OrderPosition> getOrderPositionByUuid(String uuid) {
    return (select(orderPositions)..where((o) => o.uuid.equals(uuid)))
        .getSingleOrNull()
        .then((value) {
      if (value != null) {
        return value;
      } else {
        return Future.error(RecordNotFoundException());
      }
    });
  }

  /// returns an order position that has the requested barcode
  Future<String> getOrderPositionUuidByBarcode(String barcode) async {
    final orderPosList = await (select(orderPositions)
          ..where((o) => o.barcode.equals(barcode)))
        .get();

    if (orderPosList.isEmpty) {
      return Future.error(RecordNotFoundException());
    } else {
      return orderPosList.first.uuid;
    }
  }

  ///parses synchronization json object and returns OrdersCompanion for insert
  static Future<OrderPositionsCompanion> companionFromSyncJson(
      Map<String, dynamic> json, String uuid) async {
    var db = DatabaseFactory.getDatabaseInstance();
    if (json['product'] == "") {
      throw InvalidDataException("Ungültige Daten vom Server empfangen.");
    }
    var product =
        await db.productsDao.getProductByUuidCreateIfMissing(json['product']);

    return OrderPositionsCompanion(
        uuid: Value(uuid),
        barcode: Value(json['barcode']),
        originalQuantity: Value(double.parse(json['originalQuantity'])),
        restQuantity: Value(double.parse(json['restQuantity'])),
        product: Value(product.uuid));
  }

  /// deletes orderposition with given uuid
  Future deleteOrderPositionByUuid(String uuid) {
    return (delete(orderPositions)..where((o) => o.uuid.equals(uuid))).go();
  }
}
