import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/config/api.dart';
import 'package:trendys_sdk/models/request/guest.dart' as requestModel;
import 'package:trendys_sdk/models/request/session.dart' as requestModel;
import 'package:trendys_sdk/models/request/sign_in.dart' as requestModel;
import 'package:trendys_sdk/models/responses/guests/sign_in/guest.dart';
import 'package:trendys_sdk/models/responses/sessions/sign_in/session.dart';
import 'package:trendys_sdk/models/responses/users/sign_in/user.dart';

part 'authentication_provider.g.dart';

@RestApi()
abstract class AuthenticationProvider {
  factory AuthenticationProvider(Dio dio, {String baseUrl}) = _AuthenticationProvider;

  @POST('/guests/sign_in')
  @PrivateResponseBody()
  Future<Guest> guestSignIn({@Body() requestModel.GuestCreate? guest});

  @POST('/users/sign_in')
  @PrivateBody()
  Future<User> userSignIn(@Body() requestModel.SignIn body);

  @POST('/sessions')
  @PrivateBody()
  Future<Session> refreshToken(@Body() requestModel.Session session);
}
