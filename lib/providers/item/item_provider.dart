import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/item.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/item.dart';

part 'item_provider.g.dart';

@RestApi()
abstract class ItemProvider {
  factory ItemProvider(Dio dio, {String baseUrl}) = _ItemProvider;

  @GET('/items')
  Future<HttpResponse<List<Item>>> list({
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });

  @GET('/items/{id}')
  Future<Item> get(@Path('id') String itemId);
}
