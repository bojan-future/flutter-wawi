import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'deliverypositions_dao.g.dart';

@UseDao(tables: [DeliveryPositions])

/// packets functionality extension for database
class DeliveryPositionsDao extends DatabaseAccessor<Database>
    with _$DeliveryPositionsDaoMixin {
  ///
  DeliveryPositionsDao(Database db) : super(db);

  /// inserts given delivery into database
  Future<int> createDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    return into(deliveryPositions).insert(
        deliveryPosition,
        mode: InsertMode.replace
    );
  }

  /// updates delivery in the database
  Future<bool> updateDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    return update(deliveryPositions).replace(deliveryPosition);
  }

  /// deletes delivery from the database
  Future<int> deleteDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    return delete(deliveryPositions).delete(deliveryPosition);
  }

  /// retrieves delivery with giver delivery number OR
  Future<DeliveryPosition> getDeliveryPositionByID(
      int deliveryPositionID) async {
    final deliveryPositionList = await (select(deliveryPositions)
      ..where((o) => o.id.equals(deliveryPositionID)))
        .get();

    if (deliveryPositionList.isEmpty) {
      throw ("Deliveryposition not found!");
    } else {
      return deliveryPositionList.first;
    }
  }
}