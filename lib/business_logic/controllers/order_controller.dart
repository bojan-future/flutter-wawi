import 'package:hive/hive.dart';
import 'package:kuda_demo/business_logic/models/order_model.dart';

import 'generic_controller.dart';

//generic controller

class OrderController extends GenericController<Order> {
  OrderController(Box<Order> db) : super(db);
}
