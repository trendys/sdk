import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/models/responses/common/image.dart';
import 'package:trendys_sdk/models/responses/packages/get/package.dart';
import 'package:trendys_sdk/models/responses/packages/list/package.dart';

part 'package_provider.g.dart';

@RestApi()
abstract class PackageProvider {
  factory PackageProvider(Dio dio, {String baseUrl}) = _PackageProvider;

  @GET('/packages')
  Future<HttpResponse<List<PackagePartial>>> list({
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });

  @GET('/packages/{id}')
  Future<Package> get(@Path('id') String packageId);

  @DELETE('/packages/{id}')
  Future<Destroy> destroy(@Path('id') String packageId);

  @DELETE('/packages/{id}/images')
  Future<HttpResponse<List<Image>>> images(@Path('id') String packageId);

  @POST('/packages/{id}/action')
  Future<Action> clap(@Path('id') String packageId);
}
