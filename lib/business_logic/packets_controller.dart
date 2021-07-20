import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import '../database/database.dart';
import 'business.exception.dart';

/// Business Logic for Packets
class PacketsController {
  /// Database instance
  final database = DatabaseFactory.getDatabaseInstance();

  /// add packet and extract all info from the barcode
  Future<int> addPacket(String barcode,
      {int? wrapping, bool createInexistingProduct = false}) async {
    final database = DatabaseFactory.getDatabaseInstance();

    //if already exists, return its id
    return await database.packetsDao
        .getPacketByBarcode(barcode)
        .then((packet) => packet.id, onError: (e) async {
      return await _addPacket(barcode,
          wrapping: wrapping, createInexistingProduct: createInexistingProduct);
    });
  }

  /// returns a packet that has the requested id.
  Future<Packet> getPacketWithId(int id) {
    return (database.packetsDao.getPacketWithId(id));
  }

  /// returns a packet that has the requested barcode.
  Future<Packet> getPacketByBarcode(String barcode) {
    return (database.packetsDao.getPacketByBarcode(barcode));
  }

  Future<int> _addPacket(String barcode,
      {int? wrapping, bool createInexistingProduct = false}) async {
    var productNr = "";
    var lot = "";
    var quantity;
    var gtin;
    var product;
    var correctBarcode = false;

    if (barcode.length == 44) {
      correctBarcode = true;
      gtin = barcode.substring(3, 15); //only 12 cahracters - no checksum
      quantity = barcode.substring(20, 26);
      lot = barcode.substring(28, 44);

      gtin = int.parse(gtin);
      assert(gtin is int);

      try {
        product = await database.productsDao.getProductByGTIN(gtin);
      } on RecordNotFoundException {
        var productId = await database.productsDao.createProduct(
            ProductsCompanion(
                uuid: Value(Uuid().v4()),
                gtin1: Value(gtin),
                gtin2: Value(0),
                gtin3: Value(0),
                gtin4: Value(0),
                gtin5: Value(0),
                productNr: Value(''),
                productName: Value('Unbekannter Artikel')));

        product = await database.productsDao.getProductById(productId);
      }
    }

    if (barcode.length == 36) {
      barcode = barcode.substring(0, 34);
    }

    if (barcode.length == 34) {
      correctBarcode = true;
      productNr = barcode.substring(0, 9);
      lot = barcode.substring(9, 29);
      quantity = barcode.substring(29, 34);

      try {
        product = await database.productsDao.getProductByNumber(productNr);
      } on RecordNotFoundException {
        var productId = await database.productsDao.createProduct(
            ProductsCompanion(
                uuid: Value(Uuid().v4()),
                gtin1: Value(0),
                gtin2: Value(0),
                gtin3: Value(0),
                gtin4: Value(0),
                gtin5: Value(0),
                productNr: Value(productNr),
                productName: Value('Unbekannter Artikel')));

        product = await database.productsDao.getProductById(productId);
      }
    }

    if (correctBarcode) {
      quantity = double.parse(quantity);
      assert(quantity is double);

      return database.packetsDao.createPacket(PacketsCompanion(
        uuid: Value(Uuid().v4()),
        barcode: Value(barcode),
        lot: Value(lot),
        quantity: Value(quantity),
        product: Value(product.id),
        productNr: Value(product.productNr),
        productName: Value(product.productName),
        wrapping: Value(wrapping),
      ));
    } else {
      return throw InvalidBarcodeException();
    }
  }
}
