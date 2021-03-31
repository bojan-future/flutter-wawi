import 'package:hive/hive.dart';
import 'package:kuda_lager/business_logic/models/order_model.dart';

import 'generic_controller.dart';

//generic controller

class OrderController extends GenericController<Order> {
  OrderController(Box<Order> db) : super(db);

  static const String boxName = 'orders';

  static Future<void> init() async {
    Hive.registerAdapter<Order>(OrderAdapter());
    await Hive.openBox<Order>(boxName);
  }
}
