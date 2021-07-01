import '../database/database.dart';

/// auth controller interface
abstract class AuthController {
  /// get id of the logged in user
  int getUserId();

  /// login with unique user number
  Future<bool> loginWithUserNumber(String userNr);

  /// login with unique user barcode
  Future<bool> loginWithBarcode(String barcode);
}

/// auth controller implementation wiith data from the local database
class AuthControllerImplDatabase implements AuthController {
  final _database = DatabaseFactory.getDatabaseInstance();

  User? _user;

  int getUserId() {
    if (_user == null) return -1;

    return _user!.id;
  }

  /// retrieve user with given user number
  Future<bool> loginWithUserNumber(String userNr) async {
    try {
      _user = await _database.usersDao.getUserByNumber(userNr);
    } on RecordNotFoundException {
      return false;
    }
    return true;
  }

  /// retrieve user with given barcode
  Future<bool> loginWithBarcode(String barcode) async {
    try {
      _user = await _database.usersDao.getUserByBarcode(barcode);
    } on RecordNotFoundException {
      return false;
    }
    return true;
  }
}
