import 'package:hive/hive.dart';
import 'package:kuda_lager/business_logic/models/packet_model.dart';

import 'generic_controller.dart';

//generic controller

class PacketController extends GenericController<Packet> {
  PacketController(Box<Packet> db) : super(db);

  static const String boxName = 'packets';

  static Future<void> init() async {
    Hive.registerAdapter<Packet>(PacketAdapter());
    await Hive.openBox<Packet>(boxName);
  }
}
