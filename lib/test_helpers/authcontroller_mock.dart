import '../business_logic/auth_controller.dart';

/// AuthController Mock Implementation for testing purposes
class AuthControllerImplMock implements AuthController {
  String _userNr = '';
  String _barcode = '';

  /// first element in list is userNr, second is userBarcode
  AuthControllerImplMock(List<String> testdata) {
    _userNr = testdata.first;
    _barcode = testdata.last;
  }

  /// retrieve user with given user number
  Future<bool> loginWithUserNumber(String userNr) async {
    if (userNr == _userNr) {
      return true;
    } else {
      return false;
    }
  }

  /// retrieve user with given barcode
  Future<bool> loginWithBarcode(String barcode) async {
    if (barcode == _barcode) {
      return true;
    } else {
      return false;
    }
  }

  @override
  String getUserUuid() {
    return "d43c969c-9b48-4089-91b6-beec42d1efac";
  }
}
