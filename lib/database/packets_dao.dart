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
}
