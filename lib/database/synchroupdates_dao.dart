import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'synchroupdates_dao.g.dart';

@UseDao(tables: [SynchroUpdates])

/// users functionality extension for database
class SynchroUpdatesDao extends DatabaseAccessor<Database>
    with _$SynchroUpdatesDaoMixin {
  ///
  SynchroUpdatesDao(Database db) : super(db);

  /// retrieves user with given user number
  Future<SynchroUpdate> getNext() async {
    return (select(synchroUpdates)
          ..limit(1)
          ..orderBy([(synchro) => OrderingTerm(expression: synchro.id)]))
        .getSingleOrNull()
        .then((synchro) {
      if (synchro == null) {
        return Future.error(RecordNotFoundException());
      }

      return synchro;
    });
  }

  ///inserts new synchro entry into the table
  Future<void> add(String uuid, int type, String dataJson,
      {bool deleted = false}) async {
    into(synchroUpdates).insert(
        SynchroUpdatesCompanion(
            uuid: Value(uuid),
            type: Value(type),
            deleted: Value(deleted),
            data: Value(dataJson)),
        mode: InsertMode.replace);
  }

  /// deletes synchro entry by id
  /// used after entry has been uploaded to the server
  /// using this is safe,
  /// because any new updates for the same record will get a new id
  Future<int> remove(int id) async {
    return (delete(synchroUpdates)..where((synchro) => synchro.id.equals(id)))
        .go()
        .catchError((e) => 0); //ignore errors
  }

  /// deletes synchro entry by uuid
  /// used after entry has been downloaded from the server
  /// in order not to upload older version of the data
  Future<int> removeByUuid(String uuid) async {
    return (delete(synchroUpdates)
          ..where((synchro) => synchro.uuid.equals(uuid)))
        .go()
        .catchError((e) => 0); //ignore errors
  }
}
