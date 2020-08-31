import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filter/filters.dart';
import 'package:trendys_sdk/models/request/guest.dart' as requestModel;
import 'package:trendys_sdk/models/request/session.dart' as requestModel;
import 'package:trendys_sdk/models/request/sign_in.dart' as requestModel;
import 'package:trendys_sdk/models/response/full/action.dart';
import 'package:trendys_sdk/models/response/full/guest.dart';
import 'package:trendys_sdk/models/response/full/package.dart';
import 'package:trendys_sdk/models/response/full/user.dart';
import 'package:trendys_sdk/models/response/short/package.dart';
import 'package:trendys_sdk/models/response/short/session.dart';

part 'api_adapter.g.dart';

@RestApi()
abstract class ApiAdapter {
  factory ApiAdapter(Dio dio) = _ApiAdapter;

  @POST('/guests/sign_in')
  Future<Guest> guestSignIn({@Body() requestModel.GuestCreate guest});

  @POST('/users/sign_in')
  Future<User> userSignIn(@Body() requestModel.SignIn body);

  @GET('/users/{id}')
  Future<User> getUser(@Path('id') String userId);

  @POST('/sessions')
  Future<SessionShort> refreshToken(@Body() requestModel.Session session);

  @GET('/packages')
  Future<HttpResponse<List<PackageShort>>> getPackages({@Query('page') int page = 1, @Query('filters') Filters filters});

  @GET('/packages/{id}')
  Future<PackageFull> getPackage(@Path('id') String packageId);

  @POST('/packages/{id}/action')
  Future<Action> clap(@Path('id') String packageId);

  @POST('/influencers/{id}/action')
  Future<Action> follow(@Path('id') String influencerId);
}
