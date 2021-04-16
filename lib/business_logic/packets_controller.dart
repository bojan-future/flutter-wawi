import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';

/// Business Logic for Packets
class PacketsController {
  /// add packet and extract all info from the barcode
  Future<int> addPacket(String barcode) async {
    final database = DatabaseFactory.getDatabaseInstance();

    final lot = ''; //todo: extract lot from barcode
    final quantity = 1.0; //todo: extract quantity from barcode
    final productNr = '';
    final product = await database.productsDao.getProductByNumber(productNr);

    return database.packetsDao.createPacket(PacketsCompanion(
      barcode: Value(barcode),
      lot: Value(lot),
      quantity: Value(quantity),
      product: Value(product.id),
    ));
  }
}
