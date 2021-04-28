import 'package:dio/dio.dart';
import 'package:jose/jose.dart';
import 'package:trendys_sdk/config/session_manager.dart';
import 'package:trendys_sdk/repositories/authentication_repository.dart';

class AuthenticationInterceptor extends Interceptor {
  AuthenticationInterceptor({
    required Dio dio,
    required AuthenticationRepository authenticationRepository,
    required SessionManager sessionManager,
  })   : _dio = dio,
        _authenticationRepository = authenticationRepository,
        _sessionManager = sessionManager;

  final Dio _dio;
  final AuthenticationRepository _authenticationRepository;
  final SessionManager _sessionManager;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    _dio.interceptors.requestLock.lock();

    String? accessToken = await _sessionManager.getAccessToken();
    String? refreshToken = await _sessionManager.getRefreshToken();

    if (accessToken == null && refreshToken == null) {
      accessToken = await _authenticationRepository.guestSignIn();
    } else if (accessToken == null || _isExpiredToken(accessToken)) {
      accessToken = await _authenticationRepository.refreshToken();
    }

    if (accessToken != null) options.headers['Authorization'] = 'Bearer $accessToken';

    _dio.interceptors.requestLock.unlock();

    return super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    switch (err.response?.statusCode) {
      case 401:
        final newOptions = err.requestOptions;

        _dio.interceptors.requestLock.lock();

        String? accessToken = await _authenticationRepository.refreshToken();

        if (accessToken == null) break;

        newOptions.headers['Authorization'] = 'Bearer $accessToken';

        _dio.interceptors.requestLock.unlock();

        await _dio.fetch(newOptions);

        break;
    }

    return super.onError(err, handler);
  }

  bool _isExpiredToken(String token) {
    JsonWebSignature jws;

    try {
      jws = JsonWebSignature.fromCompactSerialization(token);
    } catch (e) {
      return true;
    }

    JosePayload payload = jws.unverifiedPayload;

    if (payload.jsonContent['exp'] == null) return false;

    int remainingTime = payload.jsonContent['exp'] - DateTime.now().millisecondsSinceEpoch ~/ 1000;
    int? issuedAt = payload.jsonContent['nbf'] ?? payload.jsonContent['iat'];

    if (issuedAt == null) return remainingTime < 60;

    int validity = payload.jsonContent['exp'] - issuedAt;

    return remainingTime < (validity * 0.1);
  }
}
