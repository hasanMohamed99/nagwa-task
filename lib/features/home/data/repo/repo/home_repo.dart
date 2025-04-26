import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';

class HomeRepo {
  final ApiService _apiService;
  HomeRepo(this._apiService);

  Future<ApiResult<BooksModelResponse>> getBooksList({required int page, String? query}) async {
    try {
      final response = await _apiService.getBooksList(page: page, query: query);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
