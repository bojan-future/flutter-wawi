import 'package:hive/hive.dart';

part 'product_model.g.dart';

@HiveType(typeId: 3)
class Product extends HiveObject {
  @HiveField(0)
  final String productNr;

  Product({this.productNr});
}
