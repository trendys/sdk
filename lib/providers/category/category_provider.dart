import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/categories/get/category.dart';
import 'package:trendys_sdk/models/responses/categories/category.dart';

part 'category_provider.g.dart';

@RestApi()
abstract class CategoryProvider {
  factory CategoryProvider(Dio dio, {String baseUrl}) = _CategoryProvider;

  @GET('/categories')
  Future<HttpResponse<List<CategoryPartial>>> list({
    @Queries() PaginateFilters? paginate,
  });

  @GET('/categories/{id}')
  Future<Category> get(@Path('id') String categoryId);
}
