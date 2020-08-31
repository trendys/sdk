import 'package:dio/dio.dart';
import 'package:trendys_sdk/api_adapter.dart';
import 'package:trendys_sdk/auth.dart';
import 'package:trendys_sdk/constants.dart';

class Api {
  ApiAdapter _apiAdapter;
  Auth _auth;

  Api({String globalKey = 'trendys'}) {
    Dio dio = Dio(Constants.dioOptions);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async => await _requestInterceptor(dio, options),
      onError: _errorInterceptor,
    ));
    _apiAdapter = ApiAdapter(dio);
    _auth = Auth(globalKey);
  }

  Auth getAuth() {
    return _auth;
  }

  ApiAdapter getClient() {
    return _apiAdapter;
  }

  Future<RequestOptions> _requestInterceptor(Dio dio, RequestOptions options) async {
    dio.interceptors.requestLock.lock();

    String accessToken = await _auth.getAccessToken();
    String refreshToken = await _auth.getRefreshToken();

    if (accessToken == null && refreshToken == null) {
      accessToken = await _auth.guestSignIn();
    } else if (accessToken == null || _auth.isExpiredToken(accessToken)) {
      accessToken = await _auth.refreshToken();
    }

    options.headers['Authorization'] = 'Bearer $accessToken';

    dio.interceptors.requestLock.unlock();

    return options;
  }

  Future<RequestOptions> _retryRequestInterceptor(Dio dio, RequestOptions options) async {
    dio.interceptors.requestLock.lock();

    String accessToken = await _auth.refreshToken();

    options.headers['Authorization'] = 'Bearer $accessToken';

    dio.interceptors.requestLock.unlock();

    return options;
  }

  Future<void> _errorInterceptor(DioError dioError) async {
    String refreshToken = await _auth.getRefreshToken();

    if (refreshToken == null) return;

    switch (dioError.response.statusCode) {
      case 401:
        Dio dio = Dio(Constants.dioOptions);
        dio.interceptors.add(InterceptorsWrapper(
          onRequest: (RequestOptions options) async => await _retryRequestInterceptor(dio, options),
        ));

        await dio.request(
          dioError.request.path,
          cancelToken: dioError.request.cancelToken,
          data: dioError.request.data,
          onReceiveProgress: dioError.request.onReceiveProgress,
          onSendProgress: dioError.request.onSendProgress,
          queryParameters: dioError.request.queryParameters,
          options: dioError.request,
        );

        break;
    }

    return dioError;
  }
}
