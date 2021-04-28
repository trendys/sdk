import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/package.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/wallet.dart';
import 'package:trendys_sdk/models/responses/influencers/get/influencer.dart';
import 'package:trendys_sdk/models/responses/influencers/influencer.dart';
import 'package:trendys_sdk/models/responses/packages/list/package.dart';

part 'influencer_provider.g.dart';

@RestApi()
abstract class InfluencerProvider {
  factory InfluencerProvider(Dio dio, {String baseUrl}) = _InfluencerProvider;

  @GET('/influencers')
  Future<HttpResponse<List<InfluencerPartial>>> list({
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });

  @GET('/influencers/{id}')
  Future<Influencer> get(@Path('id') String influencerId);

  @GET('/influencers/{id}/wallets')
  Future<HttpResponse<List<Wallet>>> wallets(
    @Path('id') String influencerId, {
    @Queries() PaginateFilters? paginate,
  });

  @GET('/influencers/{id}/packages')
  Future<HttpResponse<List<PackagePartial>>> packages(
    @Path('id') String influencerId, {
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });

  @POST('/influencers/{id}/action')
  Future<Action> follow(@Path('id') String influencerId);
}
