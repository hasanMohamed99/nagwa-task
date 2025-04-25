import 'package:json_annotation/json_annotation.dart';
part 'book_item_model.g.dart';

@JsonSerializable(explicitToJson: true)
class BookItemModel {
  /// The unique identifier for the book.
  final int id;

  /// The title of the book.
  final String title;

  /// A list of authors who wrote the book. contains a list of [Author] objects.
  final List<Author> authors;

  /// A list of summaries for the book. contains a list of strings.
  final List<String> summaries;

  /// The formats available for the book. contains a [Formats] object.
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
class Author {
  final String name;
  Author({required this.name});

  Map<String, dynamic> toJson() => _$AuthorToJson(this);

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class Formats {
  @JsonKey(name: 'image/jpeg')
  final String imageLink;

  Formats({required this.imageLink});

  Map<String, dynamic> toJson() => _$FormatsToJson(this);

  factory Formats.fromJson(Map<String, dynamic> json) => _$FormatsFromJson(json);
}
