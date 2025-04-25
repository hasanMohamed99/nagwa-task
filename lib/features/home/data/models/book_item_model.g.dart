// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
