import 'package:dio/dio.dart';
import 'package:trendys_sdk/api_adapter.dart';
import 'package:trendys_sdk/auth.dart';
import 'package:trendys_sdk/constants.dart';

enum Environment {
  production,
  staging,
}

class Api {
  ApiAdapter _apiAdapter;
  Auth _auth;

  Api({Environment environment, String globalKey = 'trendys'}) {
    final dioOptions = Constants.dioOptions;

    switch (environment) {
      case Environment.production:
        dioOptions.baseUrl = Constants.productionUrl;
        break;

      case Environment.staging:
        dioOptions.baseUrl = Constants.stagingUrl;
        break;

      default:
        throw ArgumentError('environment is invalid');
    }

    Dio dio = Dio(dioOptions);
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options) async => await _requestInterceptor(dio, options),
      onError: (DioError dioError) async => await _errorInterceptor(dio, dioError),
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

  Future<void> _errorInterceptor(Dio dio, DioError dioError) async {
    switch (dioError.response.statusCode) {
      case 401:
        final newOptions = dioError.request;

        dio.interceptors.requestLock.lock();

        String accessToken = await _auth.refreshToken();

        newOptions.headers['Authorization'] = 'Bearer $accessToken';

        dio.interceptors.requestLock.unlock();

        await dio.request(
          dioError.request.path,
          cancelToken: dioError.request.cancelToken,
          data: dioError.request.data,
          onReceiveProgress: dioError.request.onReceiveProgress,
          onSendProgress: dioError.request.onSendProgress,
          queryParameters: dioError.request.queryParameters,
          options: newOptions,
        );

        break;
    }

    return dioError;
  }
}
