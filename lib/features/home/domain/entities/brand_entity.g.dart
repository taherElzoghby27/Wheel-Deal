// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BrandEntityAdapter extends TypeAdapter<BrandEntity> {
  @override
  final int typeId = 0;

  @override
  BrandEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrandEntity(
      name: fields[0] as String,
      logo: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, BrandEntity obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.logo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
