// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileAdapter extends TypeAdapter<Profile> {
  @override
  final int typeId = 2;

  @override
  Profile read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Profile(
      fullName: fields[1] as String,
      homeAddress: fields[2] as String,
      schoolCampus: fields[3] as String,
      yearSection: fields[5] as String,
      program: fields[4] as String,
      adviser: fields[6] as String,
      hte: fields[7] as Hte,
    )..id = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Profile obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.homeAddress)
      ..writeByte(3)
      ..write(obj.schoolCampus)
      ..writeByte(4)
      ..write(obj.program)
      ..writeByte(5)
      ..write(obj.yearSection)
      ..writeByte(6)
      ..write(obj.adviser)
      ..writeByte(7)
      ..write(obj.hte);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
