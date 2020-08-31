import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:jose/jose.dart';
import 'package:trendys_sdk/api_adapter.dart';
import 'package:trendys_sdk/auth_preferences.dart';
import 'package:trendys_sdk/constants.dart';
import 'package:trendys_sdk/models/request/guest.dart' as requestModels;
import 'package:trendys_sdk/models/request/session.dart' as requestModels;
import 'package:trendys_sdk/models/request/sign_in.dart' as requestModels;
import 'package:trendys_sdk/models/request/user.dart' as requestModels;
import 'package:trendys_sdk/models/response/full/guest.dart' as responseModels;
import 'package:trendys_sdk/models/response/full/user.dart' as responseModels;
import 'package:trendys_sdk/models/response/short/session.dart' as responseModels;

class Auth {
  ApiAdapter _apiAdapter;
  AuthPreferences _preferences;

  Auth(String globalKey) {
    Dio dio = Dio(Constants.dioOptions);

    _apiAdapter = ApiAdapter(dio);
    _preferences = AuthPreferences(globalKey);
  }

  Future<String> getGuestId() async {
    return _preferences.getGuestId();
  }

  Future<String> getUserId() async {
    return _preferences.getUserId();
  }

  Future<String> getAccessToken() async {
    return _preferences.getAccessToken();
  }

  Future<String> getRefreshToken() async {
    return _preferences.getRefreshToken();
  }

  Future<responseModels.User> userSignIn({@required String email, @required String password, String guestId}) async {
    guestId ??= await _preferences.getGuestId();

    await _preferences.setUserId(null);
    await _preferences.setUserAccessToken(null);
    await _preferences.setUserRefreshToken(null);

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
    var user = await _apiAdapter.userSignIn(requestBody);

    await _preferences.setUserId(user.id);
    await _preferences.setUserAccessToken(user.session.accessToken);
    await _preferences.setUserRefreshToken(user.session.refreshToken);

    await _preferences.setGuestId(null);
    await _preferences.setGuestAccessToken(null);
    await _preferences.setGuestRefreshToken(null);

    return user;
  }

  Future<String> guestSignIn({String guestId}) async {
    responseModels.Guest guest;
    guestId ??= await _preferences.getGuestId();

    if (guestId == null) {
      guest = await _apiAdapter.guestSignIn();
    } else {
      requestModels.GuestCreate requestBody = requestModels.GuestCreate(
        guest: requestModels.Guest(
          id: guestId,
        ),
      );
      guest = await _apiAdapter.guestSignIn(guest: requestBody);
    }

    await _preferences.setGuestId(guest.id);
    await _preferences.setGuestAccessToken(guest.session.accessToken);
    await _preferences.setGuestRefreshToken(guest.session.refreshToken);

    return guest.session.accessToken;
  }

  bool isExpiredToken(String token) {
    JsonWebSignature jws;

    try {
      jws = JsonWebSignature.fromCompactSerialization(token);
    } catch (e) {
      return true;
    }

    JosePayload payload = jws.unverifiedPayload;

    if (payload.jsonContent['exp'] == null) return false;

    int remainingTime = payload.jsonContent['exp'] - DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int issuedAt = payload.jsonContent['nbf'] ?? payload.jsonContent['iat'];

    if (issuedAt == null) return remainingTime < 60;

    int validity = payload.jsonContent['exp'] - issuedAt;

    return remainingTime < (validity * 0.1);
  }

  Future<String> refreshToken() async {
    String refreshToken = await _preferences.getRefreshToken();

    if (refreshToken == null) return await guestSignIn();

    String userId = await _preferences.getUserId();

    try {
      responseModels.SessionShort session = await _apiAdapter.refreshToken(requestModels.Session(refreshToken: refreshToken));

      if (userId == null) {
        await _preferences.setGuestAccessToken(session.accessToken);
        await _preferences.setGuestRefreshToken(session.refreshToken);
      } else {
        await _preferences.setUserAccessToken(session.accessToken);
        await _preferences.setUserRefreshToken(session.refreshToken);
      }

      return session.accessToken;
    } on DioError catch (dioError) {
      switch (dioError.response.statusCode) {
        case 422:
          if (userId != null) {
            await _preferences.setUserId(null);
            await _preferences.setUserAccessToken(null);
            await _preferences.setUserRefreshToken(null);
          }

          return await guestSignIn();
      }
    }

    return null;
  }
}
