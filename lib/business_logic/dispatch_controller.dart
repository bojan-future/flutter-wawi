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
  Future<String> addDispatch(String orderPositionID) async {
    return database.dispatchesDao.createDispatch(
        DispatchesCompanion(orderPositionID: Value(orderPositionID)));
  }

  /// Get dispatch by ID
  Future<Dispatch> getDispatchByUuid(String uuid) async {
    return database.dispatchesDao.getDispatchByUuid(uuid);
  }

  /// add dispatch position together with an associated packet
  Future<String> addDispatchPosition(
      String barcode,
      String dispatchID,
      PacketsController packetsController,
      OrderController orderController) async {
    final dispatch = await getDispatchByUuid(dispatchID);
    final orderPosition =
        await orderController.getOrderPositionByUuid(dispatch.orderPositionID);
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
              packet: Value(packet.uuid), dispatch: Value(dispatchID)))
          .then((newDispatchPositionUuid) {
        //update orderPosition (decrement restQuantity)
        orderController.updateOrderPosition(OrderPositionsCompanion(
            id: Value(orderPosition.id),
            restQuantity: Value(orderPosition.restQuantity - packet.quantity)));

        return newDispatchPositionUuid; //pass the value through
      });
    } else {
      return Future.error(DispatchWrongProduct());
    }
  }

  /// Get dispatch position
  Future<DispatchPosition> getDispatchPosition(
      String dispatchPositionUuid) async {
    return database.dispatchPositionsDao
        .getDispatchPositionByUuid(dispatchPositionUuid);
  }

  /// On Scan Barcode
  Future<ScanBottomSheetResult> onScanBarcode(
      String barcode, OrderController orderController) async {
    return orderController.getOrderPositionUuidByBarcode(barcode).then(
        (value) => ScanBottomSheetResult(true, value),
        onError: (e) => Future.error(ScanBottomSheetResult(false, "")));
  }
}
