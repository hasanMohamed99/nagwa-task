import 'package:nagwa_task/features/home/home_feature.dart';
import 'package:nagwa_task/core/core.dart';
import 'package:hive/hive.dart';

class HomeRepo {
  final ApiService _apiService;

  HomeRepo(this._apiService);

  Future<ApiResult<BooksModelResponse>> getBooksList({required int page, String? query}) async {
    try {
      final response = await _apiService.getBooksList(page: page, query: query);
      await deleteBooksCache();
      await _saveBooks(
        BooksModelResponse(books: response.books, resultsCount: response.resultsCount),
      );
      return ApiResult.success(response);
    } catch (error) {
      final cachedData = await _getCachedBooks();
      return cachedData != null
          ? ApiResult.success(cachedData)
          : ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<void> _saveBooks(BooksModelResponse response) async {
    final box = await Hive.openBox<BooksModelResponse>(AppConstants.kBooksBoxName);
    await box.put(0, response);
  }

  Future<BooksModelResponse?> _getCachedBooks() async {
    final box = await Hive.openBox<BooksModelResponse>(AppConstants.kBooksBoxName);
    return box.get(0);
  }

  Future<void> deleteBooksCache() async {
    final box = await Hive.openBox<BooksModelResponse>(AppConstants.kBooksBoxName);
    await box.delete(0);
  }
}
