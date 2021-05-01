import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/influencers/get/influencer.dart';
import 'package:trendys_sdk/models/responses/users/get/user.dart';

part 'user_provider.g.dart';

@RestApi()
abstract class UserProvider {
  factory UserProvider(Dio dio, {String baseUrl}) = _UserProvider;

  @GET('/users/{id}')
  Future<User> get(@Path('id') String userId);

  @GET('/users/{id}/influencers')
  Future<HttpResponse<List<Influencer>>> influencers(
    @Path('id') String userId, {
    @Queries() PaginateFilters? paginate,
    @Query('filters') Map<String, dynamic>? filters,
  });
}
