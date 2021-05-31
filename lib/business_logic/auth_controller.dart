import '../database/database.dart';

abstract class AuthController {
  int getUserId();

  Future<bool> loginWithUserNumber(String userNr);

  Future<bool> loginWithBarcode(String barcode);
}

class AuthControllerImplDatabase implements AuthController {
  final database = DatabaseFactory.getDatabaseInstance();

  User? user;

  int getUserId() {
    if (user == null) return -1;

    return user!.id;
  }

  /// retrieve user with given user number
  Future<bool> loginWithUserNumber(String userNr) async {
    try {
      user = await database.usersDao.getUserByNumber(userNr);
    } on RecordNotFoundException {
      return false;
    }
    return true;
  }

  /// retrieve user with given barcode
  Future<bool> loginWithBarcode(String barcode) async {
    try {
      user = await database.usersDao.getUserByBarcode(barcode);
    } on RecordNotFoundException {
      return false;
    }
    return true;
  }
}
