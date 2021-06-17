import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'dispatches_dao.g.dart';

@UseDao(tables: [Dispatches])

/// packets functionality extension for database
class DispatchesDao extends DatabaseAccessor<Database>
    with _$DispatchesDaoMixin {
  ///
  DispatchesDao(Database db) : super(db);

  /// inserts given dispatch into database
  Future<int> createDispatch(DispatchesCompanion dispatch) {
    return into(dispatches).insert(dispatch);
  }

  /// updates dispatch in the database
  Future<bool> updateDispatch(Dispatch dispatch) {
    return update(dispatches).replace(dispatch);
  }

  /// deletes dispatch from the database
  Future<int> deleteDispatch(Dispatch dispatch) {
    return delete(dispatches).delete(dispatch);
  }

  /// returns the dispatch that has the requested id.
  Future<Dispatch> getDispatchByID(int id) async {
    final dispatchList =
        await (select(dispatches)..where((o) => o.id.equals(id))).get();

    if (dispatchList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return dispatchList.first;
    }
  }
}
