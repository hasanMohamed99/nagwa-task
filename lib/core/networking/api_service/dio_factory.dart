import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// Private Constructor ad I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;

  static Future<Dio> getDio() async {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.contentType = Headers.jsonContentType
        ..options.headers['Accept'] = Headers.jsonContentType;
      _addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void _addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(requestBody: true, requestHeader: true, responseHeader: true),
    );
  }
}
