import 'package:dio/dio.dart';
import 'package:trendys_sdk/config/session_manager.dart';
import 'package:trendys_sdk/models/request/guest.dart' as requestModels;
import 'package:trendys_sdk/models/request/session.dart' as requestModels;
import 'package:trendys_sdk/models/request/sign_in.dart' as requestModels;
import 'package:trendys_sdk/models/responses/guests/sign_in/guest.dart';
import 'package:trendys_sdk/models/responses/sessions/sign_in/session.dart';
import 'package:trendys_sdk/models/responses/users/sign_in/user.dart';
import 'package:trendys_sdk/providers/authentication/authentication_provider.dart';

class AuthenticationRepository {
  AuthenticationRepository({
    required AuthenticationProvider authenticationProvider,
    required SessionManager sessionManager,
  })  : _authenticationProvider = authenticationProvider,
        _sessionManager = sessionManager;

  AuthenticationProvider _authenticationProvider;
  SessionManager _sessionManager;

  Future<User> userSignIn({required String email, required String password, String? guestId}) async {
    guestId ??= await _sessionManager.getGuestId();

    await _sessionManager.setUserId(null);
    await _sessionManager.setUserAccessToken(null);
    await _sessionManager.setUserRefreshToken(null);

    var requestBody = requestModels.SignIn(
      user: requestModels.UserSignIn(
        email: email,
        password: password,
      ),
      guest: guestId != null
          ? requestModels.Guest(
              id: guestId,
            )
          : null,
    );
    var user = await _authenticationProvider.userSignIn(requestBody);

    await _sessionManager.setUserId(user.id);
    await _sessionManager.setUserAccessToken(user.session.accessToken);
    await _sessionManager.setUserRefreshToken(user.session.refreshToken);

    await _sessionManager.setGuestId(null);
    await _sessionManager.setGuestAccessToken(null);
    await _sessionManager.setGuestRefreshToken(null);

    return user;
  }

  Future<String> guestSignIn({String? guestId}) async {
    Guest guest;
    guestId ??= await _sessionManager.getGuestId();

    if (guestId == null) {
      guest = await _authenticationProvider.guestSignIn();
    } else {
      requestModels.GuestCreate requestBody = requestModels.GuestCreate(
        guest: requestModels.Guest(
          id: guestId,
        ),
      );
      guest = await _authenticationProvider.guestSignIn(guest: requestBody);
    }

    await _sessionManager.setUserId(null);
    await _sessionManager.setUserAccessToken(null);
    await _sessionManager.setUserRefreshToken(null);

    await _sessionManager.setGuestId(guest.id);
    await _sessionManager.setGuestAccessToken(guest.session.accessToken);
    await _sessionManager.setGuestRefreshToken(guest.session.refreshToken);

    return guest.session.accessToken;
  }

  Future<String?> refreshToken() async {
    String? refreshToken = await _sessionManager.getRefreshToken();

    if (refreshToken == null) return await guestSignIn();

    String? userId = await _sessionManager.getUserId();

    try {
      Session session = await _authenticationProvider.refreshToken(requestModels.Session(refreshToken: refreshToken));

      if (userId == null) {
        await _sessionManager.setGuestAccessToken(session.accessToken);
        await _sessionManager.setGuestRefreshToken(session.refreshToken);
      } else {
        await _sessionManager.setUserAccessToken(session.accessToken);
        await _sessionManager.setUserRefreshToken(session.refreshToken);
      }

      return session.accessToken;
    } on DioError catch (dioError) {
      switch (dioError.response?.statusCode) {
        case 422:
          return await guestSignIn();
      }
    }

    return null;
  }
}
