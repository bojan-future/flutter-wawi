import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'users_dao.g.dart';

@UseDao(tables: [Users])

/// users functionality extension for database
class UsersDao extends DatabaseAccessor<Database> with _$UsersDaoMixin {
  ///
  UsersDao(Database db) : super(db);

  /// retrieves user with given user number
  Future<User> getUserByNumber(String userNr) async {
    final usersList =
        await (select(users)..where((u) => u.userNr.equals(userNr))).get();

    if (usersList.isEmpty) {
      throw (RecordNotFoundException);
    } else {
      return usersList.first;
    }
  }

  /// retrieves user with given barcode
  Future<User> getUserByBarcode(String barcode) async {
    final usersList =
        await (select(users)..where((u) => u.barcode.equals(barcode))).get();

    if (usersList.isEmpty) {
      throw (RecordNotFoundException);
    } else {
      return usersList.first;
    }
  }
}
