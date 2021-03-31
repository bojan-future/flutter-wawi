import 'package:hive/hive.dart';
import 'package:kuda_demo/business_logic/models/productionorder_model.dart';

import 'generic_controller.dart';

//generic controller

class ProductionOrderController extends GenericController<ProductionOrder> {
  ProductionOrderController(Box<ProductionOrder> db) : super(db);
}
