// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeBoxAdapter extends TypeAdapter<ThemeBox> {
  @override
  final int typeId = 0;

  @override
  ThemeBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeBox(
      isDark: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeBox obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isDark);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
