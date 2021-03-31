// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'productionorder_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductionOrderAdapter extends TypeAdapter<ProductionOrder> {
  @override
  final int typeId = 2;

  @override
  ProductionOrder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductionOrder(
      productionOrderNr: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ProductionOrder obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.productionOrderNr);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductionOrderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
