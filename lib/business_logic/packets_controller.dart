import 'package:moor_flutter/moor_flutter.dart';

import '../database/database.dart';
import 'business.exception.dart';

/// Business Logic for Packets
class PacketsController {
  /// Database instance
  final database = DatabaseFactory.getDatabaseInstance();

  /// add packet and extract all info from the barcode
  Future<int> addPacket(String barcode) async {
    final database = DatabaseFactory.getDatabaseInstance();
    var productNr = "";
    var lot = "";
    var quantity;
    var gtin;
    var product;
    var correctBarcode = false;

    if (barcode.length == 44) {
      correctBarcode = true;
      gtin = barcode.substring(3, 15);
      quantity = barcode.substring(20, 26);
      lot = barcode.substring(28, 44);

      gtin = int.parse(gtin);
      assert(gtin is int);

      product = await database.productsDao.getProductByGTIN(gtin);
    }

    if (barcode.length == 36) {
      barcode = barcode.substring(0, 34);
    }

    if (barcode.length == 34) {
      correctBarcode = true;
      productNr = barcode.substring(0, 9);
      lot = barcode.substring(9, 29);
      quantity = barcode.substring(29, 34);

      product = await database.productsDao.getProductByNumber(productNr);
    }

    if (correctBarcode) {
      quantity = double.parse(quantity);
      assert(quantity is double);

      return database.packetsDao.createPacket(PacketsCompanion(
          barcode: Value(barcode),
          lot: Value(lot),
          quantity: Value(quantity),
          product: Value(product.id),
          productNr: Value(product.productNr),
          productName: Value(product.productName)));
    } else {
      return throw InvalidBarcodeException();
    }
  }

  /// returns a packet that has the requested id.
  Future<Packet> getPacketWithId(int id) {
    return (database.packetsDao.getPacketWithId(id));
  }

  /// returns a packet that has the requested barcode.
  Future<Packet> getPacketByBarcode(String barcode) {
    return (database.packetsDao.getPacketByBarcode(barcode));
  }
}
