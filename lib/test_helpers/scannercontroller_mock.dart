import '../services/scanner_controller.dart';

/// ScannerController Mock Implementation for test Purposes
class ScannerControllerImplMock implements ScannerController {
  /// init with list of barcodes that are sent when onScan is called
  ScannerControllerImplMock(List<String> testBarcodes)
      : _testBarcodes = testBarcodes;

  final List<String> _testBarcodes;

  /// add further test barcodes to the list
  void addTestBarcodes(List<String> barcodeList) {
    _testBarcodes.addAll(barcodeList);
  }

  void Function(String)? _scanCallback;

  @override
  void registerCallback(void Function(String) scanCallback) {
    _scanCallback = scanCallback;
  }

  @override
  void unregisterCallback(void Function(String) scanCallback) {
    if (_scanCallback == scanCallback) {
      _scanCallback = null;
    }
  }

  @override
  void startScan() {
    if (_scanCallback != null && _testBarcodes.isNotEmpty) {
      var barcode = _testBarcodes.removeAt(0);
      _scanCallback!(barcode);
    }
  }

  @override
  void stopScan() {
    // does nothing
  }
}
