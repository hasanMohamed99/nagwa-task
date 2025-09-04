import 'api_error_model.dart';

sealed class ApiResult<T> {}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;
  ApiResultSuccess(this.data);
}

class ApiResultFailure<T> extends ApiResult<T> {
  final ApiErrorModel error;
  ApiResultFailure(this.error);
}