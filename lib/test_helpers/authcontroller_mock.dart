import '../business_logic/auth_controller.dart';

class AuthControllerImplMock implements AuthController {
  String _userNr = '';
  String _barcode = '';
  AuthControllerImplMock(List<String> testdata) {
    _userNr = testdata.first;
    _barcode = testdata.last;
  }

  /// retrieve user with given user number
  Future<bool> loginWithUserNumber(String userNr) async {
    if (userNr == '12345') {
      return true;
    } else {
      return false;
    }
  }

  /// retrieve user with given barcode
  Future<bool> loginWithBarcode(String barcode) async {
    if (barcode == '12345') {
      return true;
    } else {
      return false;
    }
  }

  @override
  int getUserId() {
    return 1;
  }
}
