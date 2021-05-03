import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';

/// Business Logic for Packets
class PacketsController {
  final database = DatabaseFactory.getDatabaseInstance();

  /// add packet and extract all info from the barcode
   static addPacket(String barcode) async {
    final database = DatabaseFactory.getDatabaseInstance();
    var productNr = "";
    var lot = "";
    var quantity = "";

    if (barcode.length == 34) {
      productNr = barcode.substring(0, 9);
      lot = barcode.substring(9, 29);
      quantity = barcode.substring(29, 34);
    } else {
      throw("Invalid Barcode!");
    };
    //todo: once article synchro is implemented, extend to 44 length barcodes

    var quantityDouble = double.parse(quantity);
    assert(quantityDouble is double);

    final product = await database.productsDao.getProductByNumber(productNr);

    return database.packetsDao.createPacket(PacketsCompanion(
      barcode: Value(barcode),
      lot: Value(lot),
      quantity: Value(quantityDouble),
      product: Value(product.id),
    ));
  }

   Future<Packet> getPacketWithId(int id) {
     return (database.packetsDao.getPacketWithId(id));
   }



}