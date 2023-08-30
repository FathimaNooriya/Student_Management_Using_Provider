// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudenNewtModelAdapter extends TypeAdapter<StudenNewtModel> {
  @override
  final int typeId = 1;

  @override
  StudenNewtModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudenNewtModel(
      id: fields[0] as int?,
      name: fields[1] as String,
      age: fields[2] as int,
      stclass: fields[3] as int,
      adress: fields[4] as String,
      image: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudenNewtModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.age)
      ..writeByte(3)
      ..write(obj.stclass)
      ..writeByte(4)
      ..write(obj.adress)
      ..writeByte(5)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudenNewtModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}