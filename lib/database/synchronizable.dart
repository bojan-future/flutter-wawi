import 'package:moor_flutter/moor_flutter.dart';

import 'database.dart';

/// add function to all DAOs
extension AddSynchroImpl on DatabaseAccessor<Database> {
  /// insert synchronization packet into database
  void addSynchroUpdate(String uuid, int type, String dataJson,
      {bool deleted = false}) {
    db.synchroUpdatesDao.add(uuid, type, dataJson, deleted: deleted);
  }
}

// ignore_for_file: public_member_api_docs
// ignore_for_file: constant_identifier_names

///enum-like class for type mapping
class SyncType {
  //incoming
  static const int product = 90;
  static const int order = 152;
  static const int order_position = 149;
  static const int production = 170;
  static const int user = 200;

  // incoming / outgoing
  static const int packet = 529;

  //outgoing
  static const int delivery = 187;
  static const int delivery_position = 188;
  static const int delivery_image = 39;
  static const int dispatch = 154;
  static const int dispatch_position = 155;
  static const int inventory = 107;
  static const int inventory_position = 999107;
  static const int production_material = 999170;
  static const int production_result = 998170;
}
