import 'package:hive/hive.dart';

part 'order_model.g.dart';

@HiveType(typeId: 1)
class Order extends HiveObject {
  @HiveField(0)
  final String orderNr;

  Order({this.orderNr});
}
