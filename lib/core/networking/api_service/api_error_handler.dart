import 'package:dio/dio.dart';
import 'api_error_model.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      if (error.response != null && error.response?.statusCode != null) {
        final statusCode = error.response?.statusCode;
        switch (error.response?.statusCode) {
          case ResponseCode.unauthenticated:
            return ApiErrorModel(
              message: ApiErrorConstants.unauthenticated,
              statusCode: statusCode,
            );
          case ResponseCode.forbidden:
            return ApiErrorModel(message: ApiErrorConstants.forbidden, statusCode: statusCode);
          case ResponseCode.notFound:
            return ApiErrorModel(
              message: error.response?.data['message'] ?? ApiErrorConstants.notFound,
              statusCode: statusCode,
            );
          case ResponseCode.unauthorized:
            return _handleError(error.response?.data);
          case ResponseCode.internalServerError:
            return ApiErrorModel(
              message: ApiErrorConstants.internalServerError,
              statusCode: statusCode,
            );
          case ResponseCode.serviceUnavailable:
            return ApiErrorModel(
              message: ApiErrorConstants.serviceUnavailable,
              statusCode: statusCode,
            );
          default:
            return ApiErrorModel(
              message: ApiErrorConstants.defaultResponse,
              statusCode: statusCode,
            );
        }
      } else {
        switch (error.type) {
          case DioExceptionType.connectionError:
            return ApiErrorModel(message: ApiErrorConstants.connectionError);
          case DioExceptionType.cancel:
            return ApiErrorModel(message: ApiErrorConstants.cancelError);
          case DioExceptionType.connectionTimeout:
            return ApiErrorModel(message: ApiErrorConstants.connectionTimeout);
          case DioExceptionType.unknown:
            return ApiErrorModel(message: ApiErrorConstants.unknown);
          case DioExceptionType.sendTimeout:
            return ApiErrorModel(message: ApiErrorConstants.sendTimeout);
          case DioExceptionType.receiveTimeout:
            return ApiErrorModel(message: ApiErrorConstants.receiveTimeout);
          case DioExceptionType.badCertificate:
            return ApiErrorModel(message: ApiErrorConstants.badCertificate);
          case DioExceptionType.badResponse:
            return _handleError(error.response?.data);
        }
      }
    } else {
      return ApiErrorModel(message: ApiErrorConstants.defaultResponse);
    }
  }
}

ApiErrorModel _handleError(dynamic data) {
  if (data['detail'] != null) {
    return ApiErrorModel(message: data['detail']);
  } else {
    return ApiErrorModel(message: ApiErrorConstants.defaultResponse);
  }
}

abstract class ApiErrorConstants {
  static const String connectionError = 'Connection to server failed';
  static const String cancelError = 'Request to server was cancelled';
  static const String connectionTimeout = 'Connection timeout with server';
  static const String unknown = 'Connection to server failed due to internet connection';
  static const String sendTimeout = 'Send timeout in connection with server';
  static const String receiveTimeout = 'Receive timeout in connection with server';
  static const String badCertificate = 'Invalid certificate';
  static const String unauthorized = 'Unauthorized';
  static const String unauthenticated = 'Unauthenticated';
  static const String internalServerError = 'Internal server error';
  static const String serviceUnavailable = 'Service unavailable, try again later';
  static const String notFound = 'Resource not found';
  static const String forbidden = 'Access is denied';
  static const String defaultResponse = 'Unknown error occurred, try again later';
}

class ResponseCode {
  // Success Codes
  static const int success = 200; // OK
  static const int created = 201; // Resource created successfully
  static const int noContent = 204; // No content

  // Client-side Error Codes
  static const int unauthenticated = 401; // Unauthorized
  static const int forbidden = 403; // Forbidden
  static const int notFound = 404; // Resource not found
  static const int unauthorized = 422; // API logic error

  // Server-side Error Codes
  static const int internalServerError = 500; // Internal server error
  static const int serviceUnavailable = 503; // Service unavailable

  // local status code
  static const int connectTimeout = -1;
  static const int cancel = -2;
  static const int receiveTimeout = -3;
  static const int sendTimeout = -4;
  static const int cacheError = -5;
  static const int noInternetConnection = -6;
  static const int default_ = -7;
}
