import 'package:hive/hive.dart';

part 'productionorder_model.g.dart';

@HiveType(typeId: 2)
class ProductionOrder extends HiveObject {
  @HiveField(0)
  final String productionOrderNr;

  ProductionOrder({this.productionOrderNr});
}
