import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:json_annotation/json_annotation.dart';
part 'books_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BooksModelResponse {
  /// The list of books in the response. contains a list of [BookItemModel] objects.
  @JsonKey(name: 'results')
  final List<BookItemModel> books;

  /// The total number of results available for the given query.
  @JsonKey(name: 'count')
  final int resultsCount;

  /// The URL for the next page of results, if available.
  final String? next;

  BooksModelResponse({required this.books, required this.resultsCount, this.next});

  Map<String, dynamic> toJson() => _$BooksModelResponseToJson(this);

  factory BooksModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksModelResponseFromJson(json);
}
