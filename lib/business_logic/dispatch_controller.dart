import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'packets_controller.dart';

/// Business Logic for Packets
class DispatchController {
  final database = DatabaseFactory.getDatabaseInstance();

  /// add dispatch
  Future<int> addDispatch(int orderID) async {
    return database.dispatchesDao
        .createDispatch(DispatchesCompanion(orderID: Value(orderID)));
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
}
