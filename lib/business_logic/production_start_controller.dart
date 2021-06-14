import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'packets_controller.dart';
import 'scan_bottom_sheet_result.dart';

/// Business Logic for Packets
class ProductionController {
  /// Database instance
  final database = DatabaseFactory.getDatabaseInstance();

  /// returns a production order that has the requested barcode
  Future<int> getProductionByBarcode(String barcode) async {
    return database.productionDao.getProductionByBarcode(barcode);
  }

  /// add production position together with an associated packet
  Future<int> addProductionMaterial(String barcode, int productionID,
      PacketsController packetsController) async {
    return packetsController.getPacketByBarcode(barcode).then((packet) {
      return database.productionMaterialsDao.createProductionMaterial(
          ProductionMaterialsCompanion(
              packet: Value(packet.id), prodOrder: Value(productionID)));
    });
  }

  /// returns a production material that has the requested id.
  Future<ProductionMaterial> getProductionMaterial(
      int productionMaterialID) async {
    return database.productionMaterialsDao
        .getProductionMaterialByID(productionMaterialID);
  }

  /// checks if the scanned barcode can be found in the production order table.
  Future<ScanBottomSheetResult> onScanProdBarcode(String barcode) async {
    return getProductionByBarcode(barcode)
        .then((productionID) => ScanBottomSheetResult(true, productionID));
  }
}
