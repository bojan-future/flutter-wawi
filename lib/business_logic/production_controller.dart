import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'packets_controller.dart';
import 'scan_bottom_sheet_result.dart';

/// Business Logic for Packets
class ProductionController {
  /// Database instance
  final database = DatabaseFactory.getDatabaseInstance();

  /// returns a production order that has the requested barcode
  Future<String> getProductionUuidByBarcode(String barcode) async {
    return database.productionDao.getProductionUuidByBarcode(barcode);
  }

  // ignore: lines_longer_than_80_chars
  /// add production position together with an associated packet (Production Start)
  Future<String> addProductionMaterial(String barcode, String productionUuid,
      PacketsController packetsController) async {
    return packetsController.getPacketByBarcode(barcode).then((packet) {
      return database.productionMaterialsDao.createProductionMaterial(
          ProductionMaterialsCompanion(
              packet: Value(packet.uuid), prodOrder: Value(productionUuid)));
    });
  }

  // ignore: lines_longer_than_80_chars
  /// add production position together with an associated packet (Production Completion)
  Future<String> addProductionResult(String barcode, String productionUuid,
      PacketsController packetsController) async {
    return packetsController.getPacketByBarcode(barcode).then((packet) {
      return database.productionResultsDao.createProductionResult(
          ProductionResultsCompanion(
              packet: Value(packet.uuid), prodOrder: Value(productionUuid)));
    });
  }

  /// returns a production material that has the requested id.
  Future<ProductionMaterial> getProductionMaterial(
      String productionMaterialUuid) async {
    return database.productionMaterialsDao
        .getProductionMaterialByUuid(productionMaterialUuid);
  }

  /// returns a production result that has the requested id.
  Future<ProductionResult> getProductionResult(
      String productionResultUuid) async {
    return database.productionResultsDao
        .getProductionResultByUuid(productionResultUuid);
  }

  /// checks if the scanned barcode can be found in the production order table.
  Future<ScanBottomSheetResult> onScanProdBarcode(String barcode) async {
    return getProductionUuidByBarcode(barcode)
        .then((productionUuid) => ScanBottomSheetResult(true, productionUuid));
  }
}
