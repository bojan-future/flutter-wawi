import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'business.exception.dart';
import 'order_controller.dart';
import 'packets_controller.dart';
import 'scan_bottom_sheet_result.dart';

/// Business Logic for Packets
class DispatchController {
  /// retrieve database
  final database = DatabaseFactory.getDatabaseInstance();

  /// add dispatch
  Future<int> addDispatch(int orderPositionID) async {
    return database.dispatchesDao.createDispatch(
        DispatchesCompanion(orderPositionID: Value(orderPositionID)));
  }

  /// Get dispatch by ID
  Future<Dispatch> getDispatchByID(int id) async {
    return database.dispatchesDao.getDispatchByID(id);
  }

  /// add dispatch position together with an associated packet
  Future<int> addDispatchPosition(
      String barcode,
      int dispatchID,
      PacketsController packetsController,
      OrderController orderController) async {
    final dispatch = await getDispatchByID(dispatchID);
    final orderPosition =
        await orderController.getOrderPositionById(dispatch.orderPositionID);
    final packet = await packetsController.getPacketByBarcode(barcode);
    if (packet.product == orderPosition.product) {
      //check quantity
      if (orderPosition.restQuantity < packet.quantity) {
        return Future.error(DispatchQuantityExceeded(
            restQuantity: orderPosition.restQuantity,
            scannedQuantity: packet.quantity));
      }
      return database.dispatchPositionsDao
          .createDispatchPosition(DispatchPositionsCompanion(
              packet: Value(packet.id), dispatch: Value(dispatchID)))
          .then((newDispatchPositionId) {
        //update orderPosition (decrement restQuantity)
        orderController.updateOrderPosition(OrderPositionsCompanion(
            id: Value(orderPosition.id),
            restQuantity: Value(orderPosition.restQuantity - packet.quantity)));
        return newDispatchPositionId; //pass the value through
      });
    } else {
      return Future.error(DispatchWrongProduct());
    }
  }

  /// Get dispatch position
  Future<DispatchPosition> getDispatchPosition(int dispatchPositionID) async {
    return database.dispatchPositionsDao
        .getDispatchPositionByID(dispatchPositionID);
  }

  /// On Scan Barcode
  Future<ScanBottomSheetResult> onScanBarcode(
      String barcode, OrderController orderController) async {
    return orderController.getOrderPositionIdByBarcode(barcode).then(
        (value) => ScanBottomSheetResult(true, value),
        onError: (e) => Future.error(ScanBottomSheetResult(false, 0)));
  }
}
