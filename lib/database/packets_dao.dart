import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

part 'packets_dao.g.dart';

@UseDao(tables: [Packets])

/// packets functionality extension for database
class PacketsDao extends DatabaseAccessor<Database> with _$PacketsDaoMixin {
  ///
  PacketsDao(Database db) : super(db);

  /// inserts given packet into database
  Future createPacket(PacketsCompanion packet) {
    return into(packets).insert(packet, mode: InsertMode.replace);
  }

  /// updates packet in the database
  Future updatePacket(Packet packet) {
    return update(packets).replace(packet);
  }

  /// deletes packet from the database
  Future deletePacket(Packet packet) {
    return delete(packets).delete(packet);
  }

  /// watcher for packet with given id
  Stream<Packet> watchPacketWithId(int id) {
    return (select(packets)..where((p) => p.id.equals(id))).watchSingle();
  }
}
