import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';
import 'database.dart';

part 'users_dao.g.dart';

@UseDao(tables: [Users])

/// users functionality extension for database
class UsersDao extends DatabaseAccessor<Database> with _$UsersDaoMixin {
  ///
  UsersDao(Database db) : super(db);

  /// inserts user into database
  Future<int> createUser(UsersCompanion user) {
    return into(users).insert(user, mode: InsertMode.replace);
  }

  /// retrieves user with given id
  Future<User> getUserById(int id) async {
    final usersList =
        await (select(users)..where((u) => u.id.equals(id))).get();

    if (usersList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return usersList.first;
    }
  }

  /// retrieves user with given user number
  Future<User> getUserByNumber(String userNr) async {
    final usersList =
        await (select(users)..where((u) => u.userNr.equals(userNr))).get();

    if (usersList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return usersList.first;
    }
  }

  /// retrieves user with given barcode
  Future<User> getUserByBarcode(String barcode) async {
    final usersList =
        await (select(users)..where((u) => u.barcode.equals(barcode))).get();

    if (usersList.isEmpty) {
      throw RecordNotFoundException();
    } else {
      return usersList.first;
    }
  }

  ///parses synchronization json object and returns UsersCompanion for insert
  static UsersCompanion companionFromSyncJson(
      Map<String, dynamic> json, String uuid) {
    return UsersCompanion(
      uuid: Value(uuid),
      userNr: Value(json['userNr']),
      barcode: Value(json['barcode']),
      //todo: other fields
    );
  }
}
