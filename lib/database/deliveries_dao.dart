import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'deliveries_dao.g.dart';

@UseDao(tables: [Deliveries])

/// packets functionality extension for database
class DeliveriesDao extends DatabaseAccessor<Database>
    with _$DeliveriesDaoMixin {
  ///
  DeliveriesDao(Database db) : super(db);

  /// inserts given delivery into database
  Future<int> createDelivery(DeliveriesCompanion delivery) {
    return into(deliveries).insert(delivery);
  }

  /// updates delivery in the database
  Future<bool> updateDelivery(Delivery delivery) {
    return update(deliveries).replace(delivery);
  }

  /// deletes delivery from the database
  Future<int> deleteDelivery(Delivery delivery) {
    return delete(deliveries).delete(delivery);
  }
}
