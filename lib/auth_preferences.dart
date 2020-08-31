import 'package:trendys_sdk/key_store.dart';

class AuthPreferences {
  static const keyGuestId = 'guest-id';
  static const keyGuestAccessToken = 'guest-access-token';
  static const keyGuestRefreshToken = 'guest-refresh-token';
  static const keyUserId = 'user-id';
  static const keyUserAccessToken = 'user-access-token';
  static const keyUserRefreshToken = 'user-refresh-token';
  final String _globalKey;

  const AuthPreferences(this._globalKey);

  String _prefix(String key) {
    return '$_globalKey.$key';
  }

  Future<String> _getString(key) async {
    return await KeyStore.getString(_prefix(key));
  }

  Future<void> _setString(key, value) async {
    return await KeyStore.setString(_prefix(key), value);
  }

  Future<String> getGuestId() async {
    return await _getString(keyGuestId);
  }

  Future<void> setGuestId(String id) async {
    return await _setString(keyGuestId, id);
  }

  Future<String> getGuestAccessToken() async {
    String accessToken = await _getString(keyGuestAccessToken);

    return accessToken == '' ? null : accessToken;
  }

  Future<void> setGuestAccessToken(String token) async {
    return await _setString(keyGuestAccessToken, token);
  }

  Future<String> getUserId() async {
    return await _getString(keyUserId);
  }

  Future<void> setUserId(String id) async {
    return await _setString(keyUserId, id);
  }

  Future<String> getUserAccessToken() async {
    String accessToken = await _getString(keyUserAccessToken);

    return accessToken == '' ? null : accessToken;
  }

  Future<void> setUserAccessToken(String token) async {
    return await _setString(keyUserAccessToken, token);
  }

  Future<String> getAccessToken() async {
    String accessToken = await getUserAccessToken();

    if (accessToken == null) {
      accessToken = await getGuestAccessToken();
    }

    return accessToken;
  }

  Future<String> getGuestRefreshToken() async {
    String refreshToken = await _getString(keyGuestRefreshToken);

    return refreshToken == '' ? null : refreshToken;
  }

  Future<void> setGuestRefreshToken(String token) async {
    return await _setString(keyGuestRefreshToken, token);
  }

  Future<String> getUserRefreshToken() async {
    String refreshToken = await _getString(keyUserRefreshToken);

    return refreshToken == '' ? null : refreshToken;
  }

  Future<void> setUserRefreshToken(String token) async {
    return await _setString(keyUserRefreshToken, token);
  }

  Future<String> getRefreshToken() async {
    String refreshToken = await getUserRefreshToken();

    if (refreshToken == null) {
      refreshToken = await getGuestRefreshToken();
    }

    return refreshToken;
  }

  Future<String> getType() async {
    String userId = await getUserId();

    if (userId == null) {
      return 'guest';
    } else {
      return 'user';
    }
  }
}
