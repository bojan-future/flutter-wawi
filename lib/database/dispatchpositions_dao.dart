import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'dispatchpositions_dao.g.dart';

@UseDao(tables: [DispatchPositions])

/// packets functionality extension for database
class DispatchPositionsDao extends DatabaseAccessor<Database>
    with _$DispatchPositionsDaoMixin {
  ///
  DispatchPositionsDao(Database db) : super(db);

  /// inserts given dispatch into database
  Future<int> createDispatchPosition(
      DispatchPositionsCompanion dispatchPosition) {
    return into(dispatchPositions)
        .insert(dispatchPosition, mode: InsertMode.replace);
  }

  /// updates dispatch in the database
  Future<bool> updateDispatchPosition(
      DispatchPositionsCompanion dispatchPosition) {
    return update(dispatchPositions).replace(dispatchPosition);
  }

  /// deletes dispatch from the database
  Future<int> deleteDispatchPosition(
      DispatchPositionsCompanion dispatchPosition) {
    return delete(dispatchPositions).delete(dispatchPosition);
  }

  /// retrieves dispatch with giver dispatch number OR
  Future<DispatchPosition> getDispatchPositionByID(
      int dispatchPositionID) async {
    final dispatchPositionList = await (select(dispatchPositions)
          ..where((o) => o.id.equals(dispatchPositionID)))
        .get();

    if (dispatchPositionList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return dispatchPositionList.first;
    }
  }
}
