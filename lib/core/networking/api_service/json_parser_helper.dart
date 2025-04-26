class JsonParserHelper {
  JsonParserHelper._();

  static bool boolFromInt(dynamic value) {
    if (value is int) return value == 1;
    if (value is bool) return value;
    if (value is String) {
      final normalized = value.toLowerCase();
      return normalized == '1' || normalized == 'true';
    }
    return false;
  }

  static DateTime? dateTimeFromStr(String? value) => value != null ? DateTime.parse(value) : null;
}
