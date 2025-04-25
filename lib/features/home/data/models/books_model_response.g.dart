// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'books_model_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BooksModelResponse _$BooksModelResponseFromJson(Map<String, dynamic> json) =>
    BooksModelResponse(
      books:
          (json['results'] as List<dynamic>)
              .map((e) => BookItemModel.fromJson(e as Map<String, dynamic>))
              .toList(),
    );

Map<String, dynamic> _$BooksModelResponseToJson(BooksModelResponse instance) =>
    <String, dynamic>{
      'results': instance.books.map((e) => e.toJson()).toList(),
    };
