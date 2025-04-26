import 'package:json_annotation/json_annotation.dart';
import 'package:hive/hive.dart';
part 'books_model_response.g.dart';

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 1)
class BooksModelResponse {
  /// The list of books in the response. contains a list of [BookItemModel] objects.
  @HiveField(0)
  @JsonKey(name: 'results')
  final List<BookItemModel> books;

  /// The total number of results available for the given query.
  @HiveField(1)
  @JsonKey(name: 'count')
  final int resultsCount;

  /// The URL for the next page of results, if available.
  @HiveField(2)
  final String? next;

  BooksModelResponse({required this.books, required this.resultsCount, this.next});

  Map<String, dynamic> toJson() => _$BooksModelResponseToJson(this);

  factory BooksModelResponse.fromJson(Map<String, dynamic> json) =>
      _$BooksModelResponseFromJson(json);

  BooksModelResponse copyWith({List<BookItemModel>? books, int? resultsCount, String? next}) {
    return BooksModelResponse(
      books: books ?? this.books,
      resultsCount: resultsCount ?? this.resultsCount,
      next: next ?? this.next,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 2)
class BookItemModel {
  /// The unique identifier for the book.
  @HiveField(0)
  final int id;

  /// The title of the book.
  @HiveField(1)
  final String title;

  /// A list of authors who wrote the book. contains a list of [Author] objects.
  @HiveField(2)
  final List<Author> authors;

  /// A list of summaries for the book. contains a list of strings.
  @HiveField(3)
  final List<String> summaries;

  /// The formats available for the book. contains a [Formats] object.
  @HiveField(4)
  final Formats formats;

  BookItemModel({
    required this.id,
    required this.title,
    required this.authors,
    required this.summaries,
    required this.formats,
  });

  Map<String, dynamic> toJson() => _$BookItemModelToJson(this);

  factory BookItemModel.fromJson(Map<String, dynamic> json) => _$BookItemModelFromJson(json);

  String getAuthorNames() {
    return authors.map((author) => author.name).join(', ');
  }

  String? getFirstSummary() {
    return summaries.isNotEmpty ? summaries.first : null;
  }

  String getImageLink() {
    return formats.imageLink;
  }
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 3)
class Author {
  /// The name of the author.
  @HiveField(0)
  final String name;
  Author({required this.name});

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@JsonSerializable(explicitToJson: true)
@HiveType(typeId: 4)
class Formats {
  /// The link to the image of the book cover.
  @HiveField(0)
  @JsonKey(name: 'image/jpeg')
  final String imageLink;

  Formats({required this.imageLink});

  Map<String, dynamic> toJson() => _$FormatsToJson(this);

  factory Formats.fromJson(Map<String, dynamic> json) => _$FormatsFromJson(json);
}
