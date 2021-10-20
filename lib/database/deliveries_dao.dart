import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';
import 'synchronizable.dart';

part 'deliveries_dao.g.dart';

@UseDao(tables: [Deliveries])

/// delivery functionality extension for database
class DeliveriesDao extends DatabaseAccessor<Database>
    with _$DeliveriesDaoMixin {
  ///
  DeliveriesDao(Database db) : super(db);

  /// inserts given delivery into database
  Future<String> createDelivery(DeliveriesCompanion delivery) {
    if (!delivery.uuid.present) {
      delivery = DeliveriesCompanion(
          uuid: Value(Uuid().v4()),
          date: delivery.date,
          pictureCount: delivery.pictureCount,
          user: delivery.user);
    }
    return into(deliveries)
        .insert(delivery, mode: InsertMode.replace)
        .then((value) {
      _getDelivery(value).then(onUpdateData);

      return delivery.uuid.value;
    });
  }

  /// inserts given delivery into database
  Future<Delivery> _getDelivery(int deliveryID) {
    final delivery =
        (select(deliveries)..where((p) => p.id.equals(deliveryID))).getSingle();
    return delivery;
  }

  /// inserts given delivery into database
  Future<Delivery> getDeliveryByUuid(String uuid) {
    final delivery =
        (select(deliveries)..where((p) => p.uuid.equals(uuid))).getSingle();
    return delivery;
  }

  /// updates delivery in the database
  Future<bool> updateDelivery(Delivery delivery) {
    return update(deliveries).replace(delivery).then((value) {
      if (value) {
        onUpdateData(delivery);
      }
      return value;
    });
  }

  /// deletes delivery from the database
  Future<int> deleteDelivery(Delivery delivery) {
    return delete(deliveries).delete(delivery).then((value) {
      if (value > 0) {
        onDeleteData(delivery);
      }
      return value;
    });
  }

  /// retrieves last 10 deliveries
  Future<List<Delivery>> getLast10Deliveries() async {
    final deliveryList = await (select(deliveries)
          ..orderBy([(deliveries) => OrderingTerm.desc(deliveries.id)])
          ..limit(10))
        .get();
    return deliveryList;
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(Delivery model) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var json = model.toJson();
    json['user'] = await db.usersDao
        .getUserByUuid(model.user)
        .then((user) => user.uuid, onError: (e) => 'null');
    addSynchroUpdate(model.uuid, SyncType.delivery, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(Delivery model) {
    addSynchroUpdate(model.uuid, SyncType.delivery, model.toJsonString(),
        deleted: true);
  }
}
