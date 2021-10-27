/// general business logic Exception
class BusinessException implements Exception {}

/// Exception for invalid barcodes
class InvalidBarcodeException extends BusinessException {}

/// Exception for already existing packets
class DeliveryPositionAlreadyExists extends BusinessException {}

/// Exception for wrong product in dispatch
class DispatchWrongProduct extends BusinessException {}

/// Exception for exceeded in dispatch
class DispatchQuantityExceeded extends BusinessException {
  /// rest Quantity in order position
  final double restQuantity;

  /// quantity scanned in this action, which would exceed rest quantity
  final double scannedQuantity;

  /// constructor
  DispatchQuantityExceeded(
      {required this.restQuantity, required this.scannedQuantity});
}

/// Exception for wrong product in dispatch
class DeliveryWrongProduct extends BusinessException {}

/// Exception for exceeded in dispatch
class DeliveryQuantityExceeded extends BusinessException {
  /// rest Quantity in order position
  final double restQuantity;

  /// quantity scanned in this action, which would exceed rest quantity
  final double scannedQuantity;

  /// constructor
  DeliveryQuantityExceeded(
      {required this.restQuantity, required this.scannedQuantity});
}
