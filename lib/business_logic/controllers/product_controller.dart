import 'package:hive/hive.dart';
import 'package:kuda_lager/business_logic/models/product_model.dart';

import 'generic_controller.dart';

//generic controller

class ProductController extends GenericController<Product> {
  ProductController(Box<Product> db) : super(db);

  static const String boxName = 'products';

  static Future<void> init() async {
    Hive.registerAdapter<Product>(ProductAdapter());
    await Hive.openBox<Product>(boxName);
  }
}
