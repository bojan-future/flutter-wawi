import 'package:kuda_lager/database/packets_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:test/test.dart';
import 'package:moor/ffi.dart';

import 'package:kuda_lager/database/database.dart';

void main() {
  Database database;

  setUp(() {
    database = Database(VmDatabase.memory());
  });
  tearDown(() async {
    await database.close();
  });

  test('packet can be created', () async {
    final testBarcode = '013843323999643110006035103314112210121012';

    final testProduct =
        await database.productsDao.getProductByNumber('500067502');

    final id = await database.packetsDao.createPacket(PacketsCompanion(
      barcode: Value(testBarcode),
      lot: Value('20230122'),
      quantity: Value(600),
      product: Value(testProduct.id),
    ));

    final packet = await database.packetsDao.watchPacketWithId(id).first;

    expect(packet.barcode, testBarcode);
    expect(packet.product, testProduct.id);
  });
}
