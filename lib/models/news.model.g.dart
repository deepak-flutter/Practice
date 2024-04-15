// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArticlesAdapter extends TypeAdapter<Articles> {
  @override
  final int typeId = 0;

  @override
  Articles read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Articles()
      .._source = fields[0] as Source?
      .._author = fields[1] as String?
      .._title = fields[2] as String?
      .._description = fields[3] as String?
      .._url = fields[4] as String?
      .._urlToImage = fields[5] as String?
      .._publishedAt = fields[6] as String?
      .._content = fields[7] as String?;
  }

  @override
  void write(BinaryWriter writer, Articles obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj._source)
      ..writeByte(1)
      ..write(obj._author)
      ..writeByte(2)
      ..write(obj._title)
      ..writeByte(3)
      ..write(obj._description)
      ..writeByte(4)
      ..write(obj._url)
      ..writeByte(5)
      ..write(obj._urlToImage)
      ..writeByte(6)
      ..write(obj._publishedAt)
      ..writeByte(7)
      ..write(obj._content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArticlesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SourceAdapter extends TypeAdapter<Source> {
  @override
  final int typeId = 5;

  @override
  Source read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Source()
      .._id = fields[0] as String?
      .._name = fields[1] as String?;
  }

  @override
  void write(BinaryWriter writer, Source obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj._id)
      ..writeByte(1)
      ..write(obj._name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourceAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
