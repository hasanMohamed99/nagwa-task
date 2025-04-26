// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BooksModelResponseAdapter extends TypeAdapter<BooksModelResponse> {
  @override
  final int typeId = 1;

  @override
  BooksModelResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BooksModelResponse(
      books: (fields[0] as List).cast<BookItemModel>(),
      resultsCount: (fields[1] as num).toInt(),
      next: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BooksModelResponse obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.books)
      ..writeByte(1)
      ..write(obj.resultsCount)
      ..writeByte(2)
      ..write(obj.next);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BooksModelResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BookItemModelAdapter extends TypeAdapter<BookItemModel> {
  @override
  final int typeId = 2;

  @override
  BookItemModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BookItemModel(
      id: (fields[0] as num).toInt(),
      title: fields[1] as String,
      authors: (fields[2] as List).cast<Author>(),
      summaries: (fields[3] as List).cast<String>(),
      formats: fields[4] as Formats,
    );
  }

  @override
  void write(BinaryWriter writer, BookItemModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.authors)
      ..writeByte(3)
      ..write(obj.summaries)
      ..writeByte(4)
      ..write(obj.formats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookItemModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class AuthorAdapter extends TypeAdapter<Author> {
  @override
  final int typeId = 3;

  @override
  Author read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Author(name: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, Author obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FormatsAdapter extends TypeAdapter<Formats> {
  @override
  final int typeId = 4;

  @override
  Formats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Formats(imageLink: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, Formats obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.imageLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksModelResponse _$BooksModelResponseFromJson(Map<String, dynamic> json) =>
    BooksModelResponse(
      books:
          (json['results'] as List<dynamic>)
              .map((e) => BookItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
      resultsCount: (json['count'] as num).toInt(),
      next: json['next'] as String?,
    );

Map<String, dynamic> _$BooksModelResponseToJson(BooksModelResponse instance) =>
    <String, dynamic>{
      'results': instance.books.map((e) => e.toJson()).toList(),
      'count': instance.resultsCount,
      'next': instance.next,
    };

BookItemModel _$BookItemModelFromJson(Map<String, dynamic> json) =>
    BookItemModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      authors:
          (json['authors'] as List<dynamic>)
              .map((e) => Author.fromJson(e as Map<String, dynamic>))
              .toList(),
      summaries:
          (json['summaries'] as List<dynamic>).map((e) => e as String).toList(),
      formats: Formats.fromJson(json['formats'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookItemModelToJson(BookItemModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'authors': instance.authors.map((e) => e.toJson()).toList(),
      'summaries': instance.summaries,
      'formats': instance.formats.toJson(),
    };

Author _$AuthorFromJson(Map<String, dynamic> json) =>
    Author(name: json['name'] as String);

Map<String, dynamic> _$AuthorToJson(Author instance) => <String, dynamic>{
  'name': instance.name,
};

Formats _$FormatsFromJson(Map<String, dynamic> json) =>
    Formats(imageLink: json['image/jpeg'] as String);

Map<String, dynamic> _$FormatsToJson(Formats instance) => <String, dynamic>{
  'image/jpeg': instance.imageLink,
};
