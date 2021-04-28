import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/component.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/component.dart';

part 'component_provider.g.dart';

@RestApi()
abstract class ComponentProvider {
  factory ComponentProvider(Dio dio, {String baseUrl}) = _ComponentProvider;

  @GET('/components')
  Future<HttpResponse<List<Component>>> list({
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });

  @GET('/components/{id}')
  Future<Component> get(@Path('id') String componentId);
}
