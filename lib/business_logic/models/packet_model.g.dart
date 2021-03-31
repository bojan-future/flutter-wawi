// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packet_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PacketAdapter extends TypeAdapter<Packet> {
  @override
  final int typeId = 0;

  @override
  Packet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Packet(
      barcode: fields[0] as String,
      charge: fields[1] as String,
      productKey: fields[2] as int,
      wrappingKey: fields[4] as int,
    )..quantity = fields[3] as double;
  }

  @override
  void write(BinaryWriter writer, Packet obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.barcode)
      ..writeByte(1)
      ..write(obj.charge)
      ..writeByte(2)
      ..write(obj.productKey)
      ..writeByte(3)
      ..write(obj.quantity)
      ..writeByte(4)
      ..write(obj.wrappingKey);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PacketAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
