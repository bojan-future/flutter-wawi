/// general business logic Exception
class BusinessException implements Exception {}

/// Exception for invalid barcodes
class InvalidBarcodeException extends BusinessException {}

/// Exception for already existing packets
class DeliveryPositionAlreadyExists extends BusinessException {}
