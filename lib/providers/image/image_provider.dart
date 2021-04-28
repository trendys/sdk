import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/models/responses/suggested_Items/list/suggested_item.dart';

part 'image_provider.g.dart';

@RestApi()
abstract class ImageProvider {
  factory ImageProvider(Dio dio, {String baseUrl}) = _ImageProvider;

  @DELETE('/images/{id}')
  Future<Destroy> destroy(@Path('id') String imageId);

  @GET('/images/{id}/suggested_items')
  Future<HttpResponse<List<SuggestedItem>>> suggestedItems(
    @Path('id') String imageId, {
    @Queries() PaginateFilters? paginate,
  });
}
