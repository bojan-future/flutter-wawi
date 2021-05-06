import '../database/database.dart';

/// Business Logic for Packets
class AuthController {
  final database = DatabaseFactory.getDatabaseInstance();

  var userID;
  var user;

  /// retrieve user with given user number
  Future<bool> loginWithUserNumber(String userNr) async {
    try {
      user = await database.usersDao.getUserByNumber(userNr);
    } on RecordNotFoundException {
      return false;
    }
    userID = user.id;
    return true;
  }

  /// retrieve user with given barcode
  Future<bool> loginWithBarcode(String barcode) async {
    try {
      user = await database.usersDao.getUserByBarcode(barcode);
    } on RecordNotFoundException {
      return false;
    }
    userID = user.id;
    return true;
  }
}
