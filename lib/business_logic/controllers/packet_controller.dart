import 'package:hive/hive.dart';
import 'package:kuda_demo/business_logic/models/packet_model.dart';

import 'generic_controller.dart';

//generic controller

class PacketController extends GenericController<Packet> {
  PacketController(Box<Packet> db) : super(db);
}
