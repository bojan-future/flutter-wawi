/// Scan Bottom Sheet Result
class ScanBottomSheetResult {
  /// Result beeing given back after a scan
  ScanBottomSheetResult(this.success, this.parentID);

  /// Scan was successfull
  final bool success;

  /// ID of the scanned record
  final String parentID;
}
