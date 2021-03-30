import 'package:hive/hive.dart';

part 'packet_model.g.dart';

@HiveType(typeId: 0)
class Packet extends HiveObject {
  @HiveField(0)
  final String barcode;

  @HiveField(1)
  final String charge;

  @HiveField(2)
  final int productKey;

  @HiveField(3)
  double quantity;

  //todo: photos field (multiple photos)

  Packet({this.barcode, this.charge, this.productKey});
}
