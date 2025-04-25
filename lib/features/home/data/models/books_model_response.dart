import 'package:json_annotation/json_annotation.dart';
import '../../home_feature.dart';
part 'books_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BooksModelResponse {
  /// The list of books in the response. contains a list of [BookItemModel] objects.
  @JsonKey(name: 'results')
  final List<BookItemModel> books;
  BooksModelResponse({required this.books});

  Map<String, dynamic> toJson() => _$BooksModelResponseToJson(this);

  factory BooksModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksModelResponseFromJson(json);
}
