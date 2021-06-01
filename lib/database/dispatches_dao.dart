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
}
