import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  static final String apiUrl = dotenv.env['API_BASE_URL'] ?? '';

  /// Home
  static const String booksList = '/books';
}
