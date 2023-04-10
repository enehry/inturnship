// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hte.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HteAdapter extends TypeAdapter<Hte> {
  @override
  final int typeId = 1;

  @override
  Hte read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Hte(
      name: fields[1] as String,
      address: fields[2] as String,
      contactNumber: fields[3] as String,
      totalHours: fields[4] as int,
      hoursPerDay: fields[5] as int,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Hte obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.contactNumber)
      ..writeByte(4)
      ..write(obj.totalHours)
      ..writeByte(5)
      ..write(obj.hoursPerDay);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HteAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
