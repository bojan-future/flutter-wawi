import 'package:moor_flutter/moor_flutter.dart';
import 'package:test/test.dart';
import 'package:moor/ffi.dart';

import 'package:kuda_lager/database/database.dart';
import 'package:uuid/uuid.dart';

void main() {
  Database? database;

  setUp(() {
    database = Database(VmDatabase.memory());
  });
  tearDown(() async {
    await database!.close();
  });

  test('packet can be created', () async {
    final testBarcode = '013843323999643110006035103314112210121012';

    await database!.productsDao.createProduct(ProductsCompanion(
        uuid: Value(Uuid().v4()),
        productName: Value('Test Product'),
        productNr: Value('500067502'),
        gtin1: Value(0),
        gtin2: Value(0),
        gtin3: Value(0),
        gtin4: Value(0),
        gtin5: Value(0)));
    final testProduct =
        await database!.productsDao.getProductByNumber('500067502');

    final id = await database!.packetsDao.createPacket(PacketsCompanion(
      uuid: Value(Uuid().v4()),
      barcode: Value(testBarcode),
      lot: Value('20230122'),
      quantity: Value(600),
      product: Value(testProduct.id),
      productName: Value(testProduct.productName),
      productNr: Value(testProduct.productNr),
    ));

    final packet = await database!.packetsDao.getPacketWithId(id);

    expect(packet.barcode, testBarcode);
    expect(packet.product, testProduct.id);
  });

  test('dispatch can be created', () async {
    final id = await database!.dispatchesDao
        .createDispatch(DispatchesCompanion(orderPositionID: Value(1)));
    final dispatch = await database!.dispatchesDao.getDispatchByID(id);

    expect(dispatch.id, id);
    expect(dispatch.orderPositionID, 1);
  });

  test('ignore synchroUpdates delete errors', () async {
    final id =
        await database!.synchroUpdatesDao.remove(9999999); //non existing id

    expect(id, 0);
  });
}
