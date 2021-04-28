import 'package:trendys_sdk/config/key_store.dart';
import 'package:trendys_sdk/enums/user_type.dart';

class SessionManager {
  static const keyGuestId = 'guest-id';
  static const keyGuestAccessToken = 'guest-access-token';
  static const keyGuestRefreshToken = 'guest-refresh-token';
  static const keyUserId = 'user-id';
  static const keyUserAccessToken = 'user-access-token';
  static const keyUserRefreshToken = 'user-refresh-token';
  final String _globalKey;

  const SessionManager(this._globalKey);

  String _prefix(String key) {
    return '$_globalKey.$key';
  }

  Future<String?> _getString(String key) async {
    return await KeyStore.getString(_prefix(key));
  }

  Future<void> _setString(String key, String? value) async {
    return await KeyStore.setString(_prefix(key), value);
  }

  Future<String?> getGuestId() async {
    String? guestId = (await _getString(keyGuestId))?.trim();

    return guestId == null || guestId.isEmpty ? null : guestId;
  }

  Future<void> setGuestId(String? id) async {
    return await _setString(keyGuestId, id);
  }

  Future<String?> getGuestAccessToken() async {
    String? accessToken = (await _getString(keyGuestAccessToken))?.trim();

    return accessToken == null || accessToken.isEmpty ? null : accessToken;
  }

  Future<void> setGuestAccessToken(String? token) async {
    return await _setString(keyGuestAccessToken, token);
  }

  Future<String?> getUserId() async {
    String? userId = (await _getString(keyUserId))?.trim();

    return userId == null || userId.isEmpty ? null : userId;
  }

  Future<void> setUserId(String? id) async {
    return await _setString(keyUserId, id);
  }

  Future<String?> getUserAccessToken() async {
    String? accessToken = (await _getString(keyUserAccessToken))?.trim();

    return accessToken == null || accessToken.isEmpty ? null : accessToken;
  }

  Future<void> setUserAccessToken(String? token) async {
    return await _setString(keyUserAccessToken, token);
  }

  Future<String?> getId() async {
    String? id = await getUserId();

    if (id == null) {
      id = await getGuestId();
    }

    return id;
  }

  Future<String?> getAccessToken() async {
    String? accessToken = await getUserAccessToken();

    if (accessToken == null) {
      accessToken = await getGuestAccessToken();
    }

    return accessToken;
  }

  Future<String?> getGuestRefreshToken() async {
    String? refreshToken = (await _getString(keyGuestRefreshToken))?.trim();

    return refreshToken == null || refreshToken.isEmpty ? null : refreshToken;
  }

  Future<void> setGuestRefreshToken(String? token) async {
    return await _setString(keyGuestRefreshToken, token);
  }

  Future<String?> getUserRefreshToken() async {
    String? refreshToken = (await _getString(keyUserRefreshToken))?.trim();

    return refreshToken == null || refreshToken.isEmpty ? null : refreshToken;
  }

  Future<void> setUserRefreshToken(String? token) async {
    return await _setString(keyUserRefreshToken, token);
  }

  Future<String?> getRefreshToken() async {
    String? refreshToken = await getUserRefreshToken();

    if (refreshToken == null) {
      refreshToken = await getGuestRefreshToken();
    }

    return refreshToken;
  }

  Future<UserType> getType() async {
    String? userId = await getUserId();

    if (userId == null) {
      return UserType.guest;
    } else {
      return UserType.user;
    }
  }
}
