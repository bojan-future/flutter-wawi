import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'deliveries_dao.g.dart';

@UseDao(tables: [Deliveries])

/// delivery functionality extension for database
class DeliveriesDao extends DatabaseAccessor<Database>
    with _$DeliveriesDaoMixin {
  ///
  DeliveriesDao(Database db) : super(db);

  /// inserts given delivery into database
  Future<int> createDelivery(DeliveriesCompanion delivery) {
    return into(deliveries).insert(delivery);
  }

  /// inserts given delivery into database
  Future<Delivery> getDelivery(int deliveryID) {
    final delivery =
        (select(deliveries)..where((p) => p.id.equals(deliveryID))).getSingle();
    return delivery;
  }

  /// updates delivery in the database
  Future<bool> updateDelivery(Delivery delivery) {
    return update(deliveries).replace(delivery);
  }

  /// deletes delivery from the database
  Future<int> deleteDelivery(Delivery delivery) {
    return delete(deliveries).delete(delivery);
  }

  /// retrieves last 10 deliveries
  Future<List<Delivery>> getLast10Deliveries() async {
    var countExp = deliveries.id.count();
    final query = selectOnly(deliveries)..addColumns([countExp]);
    var rowCount = await query.map((row) => row.read(countExp)).getSingle();
    rowCount -= 10;
    final deliveryList = await (select(deliveries)
          ..where((d) => d.id.isBiggerThanValue(rowCount)))
        .get();
    return deliveryList;
  }
}
