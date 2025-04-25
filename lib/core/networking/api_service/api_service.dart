import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import '../../../features/home/home_feature.dart';
import 'api_constants.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET(ApiConstants.booksList)
  Future<BooksModelResponse> getBooksList(@Query('page') int page);
}
