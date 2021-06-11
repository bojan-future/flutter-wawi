/// general Scanner Exception
class ScannerException implements Exception {}

///thrown, when a Barcode was scanned that is invalid or is not assigned to any record
class InvalidBarcodeException extends ScannerException {}
