import 'package:hive/hive.dart';
import 'package:kuda_lager/business_logic/models/production_model.dart';

import 'generic_controller.dart';

//generic controller

class ProductionController extends GenericController<Production> {
  ProductionController(Box<Production> db) : super(db);

  static const String boxName = 'production_orders';

  static Future<void> init() async {
    Hive.registerAdapter<Production>(ProductionOrderAdapter());
    await Hive.openBox<Production>(boxName);
  }
}
