import 'dart:convert';

import 'package:moor_flutter/moor_flutter.dart';
import 'package:uuid/uuid.dart';

import 'database.dart';
import 'synchronizable.dart';

part 'packets_dao.g.dart';

@UseDao(tables: [Packets])

/// packets functionality extension for database
class PacketsDao extends DatabaseAccessor<Database> with _$PacketsDaoMixin {
  ///
  PacketsDao(Database db) : super(db);

  /// inserts given packet into database
  Future<int> createPacket(PacketsCompanion packet) {
    if (!packet.uuid.present) {
      packet = PacketsCompanion(
        uuid: Value(Uuid().v4()),
        barcode: packet.barcode,
        product: packet.product,
        lot: packet.lot,
        productName: packet.productName,
        productNr: packet.productNr,
        quantity: packet.quantity,
        wrapping: packet.wrapping,
      );
    }
    return into(packets).insert(packet, mode: InsertMode.replace).then((value) {
      getPacketWithId(value).then(onUpdateData);
      return value;
    });
  }

  /// updates packet in the database
  Future<bool> updatePacket(Packet packet) {
    return update(packets).replace(packet).then((success) {
      if (success) {
        onUpdateData(packet);
      }
      return success;
    });
  }

  /// deletes packet from the database
  Future<int> deletePacket(Packet packet) {
    return delete(packets).delete(packet).then((id) {
      if (id > 0) {
        onDeleteData(packet);
      }
      return id;
    });
  }

  /// watcher for packet with given id
  Future<Packet> getPacketWithId(int id) {
    return (select(packets)..where((p) => p.id.equals(id))).getSingle();
  }

  /// returns a packet that has the requested barcode
  Future<Packet> getPacketByBarcode(String barcode) {
    return (select(packets)..where((p) => p.barcode.equals(barcode)))
        .getSingleOrNull()
        .then((value) {
      if (value == null) {
        throw RecordNotFoundException();
      } else {
        return value;
      }
    });
  }

  ///parses synchronization json object and returns PacketsCompanion for insert
  static Future<PacketsCompanion> companionFromSyncJson(
      Map<String, dynamic> json, String uuid) async {
    var db = DatabaseFactory.getDatabaseInstance();
    var product = await db.productsDao
        .getProductByUuid(json['product_uuid'])
        .then((product) => product, onError: (e) {
      db.productsDao
          .createProduct(ProductsCompanion(uuid: Value(json['product_uuid'])))
          .then((productId) {
        return db.productsDao.getProductById(productId);
      });
    });

    return PacketsCompanion(
      uuid: Value(uuid),
      barcode: Value(json['barcode']),
      lot: Value(json['lot']),
      quantity: Value(json['quantity']),
      product: Value(product.id),
      productName: Value(product.productName),
      productNr: Value(product.productNr),
      //todo: other fields
    );
  }

  ///hook executed when record has been changed
  Future<void> onUpdateData(Packet model) async {
    var json = model.toJson();
    json['wrapping'] = await getPacketWithId(model.wrapping!)
        .then((wrapping) => wrapping.uuid, onError: (e) => 'null')
        .catchError((e) => 'null');

    addSynchroUpdate(model.uuid, SyncType.packet, jsonEncode(json));
  }

  ///hook executed when record has been deleted
  void onDeleteData(Packet model) {
    addSynchroUpdate(model.uuid, SyncType.packet, model.toJsonString(),
        deleted: true);
  }
}
