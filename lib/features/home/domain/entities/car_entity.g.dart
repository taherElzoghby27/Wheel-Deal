// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'car_entity.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CarEntityAdapter extends TypeAdapter<CarEntity> {
  @override
  final int typeId = 1;

  @override
  CarEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CarEntity(
      id: fields[0] as num,
      image: fields[1] as String,
      title: fields[2] as String,
      priceCar: fields[3] as num,
    );
  }

  @override
  void write(BinaryWriter writer, CarEntity obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.image)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.priceCar);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CarEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
