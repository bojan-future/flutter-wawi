import 'package:kuda_lager/database/products_dao.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'database.dart';

part 'packets_dao.g.dart';

@UseDao(tables: [Packets])

/// packets functionality extension for database
class PacketsDao extends DatabaseAccessor<Database> with _$PacketsDaoMixin {
  ///
  PacketsDao(Database db) : super(db);

  /// inserts given packet into database
  Future<int> createPacket(PacketsCompanion packet) {
    return into(packets).insert(packet, mode: InsertMode.replace);
  }

  /// updates packet in the database
  Future<bool> updatePacket(Packet packet) {
    return update(packets).replace(packet);
  }

  /// deletes packet from the database
  Future<int> deletePacket(Packet packet) {
    return delete(packets).delete(packet);
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
    var productId = await ProductsDao(db)
        .getProductByUuid(json['product_uuid'])
        .then((product) => product.id, onError: (e) => 0);
    return PacketsCompanion(
      uuid: Value(uuid),
      barcode: Value(json['barcode']),
      lot: Value(json['lot']),
      quantity: Value(json['quantity']),
      product: Value(productId),
      //todo: other fields
    );
  }
}
