import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'order_controller.dart';
import 'packets_controller.dart';
import 'scan_bottom_sheet_result.dart';

/// Business Logic for Packets
class DispatchController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// add dispatch
  Future<int> addDispatch(int orderID) async {
    return database.dispatchesDao
        .createDispatch(DispatchesCompanion(orderID: Value(orderID)));
  }

  /// Get dispatch by ID
  Future<Dispatch> getDispatchByID(int id) async {
    return database.dispatchesDao.getDispatchByID(id);
  }

  /// add dispatch position together with an associated packet
  Future<int> addDispatchPosition(String barcode, int dispatchID,
      PacketsController packetsController) async {
    return packetsController.getPacketByBarcode(barcode).then((packet) {
      return database.dispatchPositionsDao.createDispatchPosition(
          DispatchPositionsCompanion(
              packet: Value(packet.id), dispatch: Value(dispatchID)));
    });
  }

  /// Get dispatch position
  Future<DispatchPosition> getDispatchPosition(int dispatchPositionID) async {
    return database.dispatchPositionsDao
        .getDispatchPositionByID(dispatchPositionID);
  }

  /// On Scan Barcode
  Future<ScanBottomSheetResult> onScanBarcode(
      String barcode, OrderController orderController) async {
    return orderController.getOrderByBarcode(barcode).then(
        (value) => ScanBottomSheetResult(true, value),
        onError: (e) => Future.error(ScanBottomSheetResult(false, 0)));
  }
}
