import 'package:flutter/cupertino.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:provider/provider.dart';

import '../business_logic/scanBottomSheetResult.dart';
import '../database/database.dart';
import 'order_controller.dart';
import 'packets_controller.dart';
import 'scanBottomSheetResult.dart';
import 'scanner.exception.dart';

/// Business Logic for Packets
class DispatchController {
  final database = DatabaseFactory.getDatabaseInstance();

  /// add dispatch
  Future<int> addDispatch(int orderID) async {
    return database.dispatchesDao
        .createDispatch(DispatchesCompanion(orderID: Value(orderID)));
  }

  Future<Dispatch> getDispatchByID(int id) async {
    return database.dispatchesDao.getDispatchByID(id);
  }

  /// add dispatch position together with an associated packet
  Future<int> addDispatchPosition(String barcode, int dispatchID) async {
    int packetID = await PacketsController.addPacket(barcode);

    if (packetID == -1) {
      return packetID;
    } else {
      return database.dispatchPositionsDao.createDispatchPosition(
          DispatchPositionsCompanion(
              packet: Value(packetID), dispatch: Value(dispatchID)));
    }
  }

  Future<DispatchPosition> getDispatchPosition(int dispatchPositionID) async {
    return database.dispatchPositionsDao
        .getDispatchPositionByID(dispatchPositionID);
  }

  Future<ScanBottomSheetResult> onScanBarcode(
      String barcode, BuildContext context) async {
    var orderController = Provider.of<OrderController>(context, listen: false);
    var orderID = await orderController.getOrderByBarcode(barcode);

    if (orderID > 0) {
      return Future.value(ScanBottomSheetResult(true, orderID));
    } else {
      return Future.error(ScanBottomSheetResult(false, 0));
    }
  }
}
