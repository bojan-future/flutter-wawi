import 'package:hive/hive.dart';

part 'production_model.g.dart';

@HiveType(typeId: 2)
class Production extends HiveObject {
  @HiveField(0)
  final String productionOrderNr;

  Production({this.productionOrderNr});
}
