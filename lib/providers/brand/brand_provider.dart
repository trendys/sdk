import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/brands/get/brand.dart';
import 'package:trendys_sdk/models/responses/common/item.dart';

part 'brand_provider.g.dart';

@RestApi()
abstract class BrandProvider {
  factory BrandProvider(Dio dio, {String baseUrl}) = _BrandProvider;

  @GET('/brands')
  Future<HttpResponse<List<Brand>>> list({
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });

  @GET('/brands/{id}')
  Future<Brand> get(@Path('id') String brandId);

  @GET('/brands/{id}/items')
  Future<HttpResponse<List<Item>>> items(
    @Path('id') String brandId, {
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });
}
