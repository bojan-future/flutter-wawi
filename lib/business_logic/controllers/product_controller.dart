import 'package:hive/hive.dart';
import 'package:kuda_demo/business_logic/models/product_model.dart';

import 'generic_controller.dart';

//generic controller

class ProductController extends GenericController<Product> {
  ProductController(Box<Product> db) : super(db);
}
