import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'deliverypositions_dao.g.dart';

@UseDao(tables: [DeliveryPositions])

/// delivery positions functionality extension for database
class DeliveryPositionsDao extends DatabaseAccessor<Database>
    with _$DeliveryPositionsDaoMixin {
  ///
  DeliveryPositionsDao(Database db) : super(db);

  /// inserts given delivery position into database
  Future<int> createDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    return into(deliveryPositions)
        .insert(deliveryPosition, mode: InsertMode.replace);
  }

  /// updates delivery position in the database
  Future<bool> updateDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    return update(deliveryPositions).replace(deliveryPosition);
  }

  /// deletes delivery position from the database
  Future<int> deleteDeliveryPosition(
      DeliveryPositionsCompanion deliveryPosition) {
    return delete(deliveryPositions).delete(deliveryPosition);
  }

  /// retrieves delivery position with given ID
  Future<DeliveryPosition> getDeliveryPositionByID(
      int deliveryPositionID) async {
    final deliveryPositionList = await (select(deliveryPositions)
          ..where((o) => o.id.equals(deliveryPositionID)))
        .get();

    if (deliveryPositionList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return deliveryPositionList.first;
    }
  }
}
