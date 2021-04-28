import 'package:dio/dio.dart' hide Headers;
import 'package:logging/logging.dart' show Level;
import 'package:trendys_sdk/config/api.dart';
import 'package:trendys_sdk/config/app_logger.dart';
import 'package:uuid/uuid.dart';

class LoggerInterceptor extends Interceptor {
  final AppLogger _logger;

  LoggerInterceptor({
    required AppLogger logger,
  }) : _logger = logger;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    const uuid = Uuid();

    options.extra['requestUuid'] = uuid.v4();

    _printRequest(options);

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _printResponse(response, response.requestOptions);

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    _printResponse(err.response, err.requestOptions, errorType: err.type);

    return super.onError(err, handler);
  }

  void _printRequest(RequestOptions options) {
    final tags = '[${options.extra['requestUuid']}]';
    String? body;

    if (options.data != null) {
      body = options.data.toString();

      if (options.extra[Api.kPrivateRequestBody] == true) {
        body = '(private body with ${body.length} bytes)';
      }
    }

    _logger.network('$tags --> ${options.method} ${options.uri}', extra: body);
  }

  void _printResponse(Response? response, RequestOptions options, {DioErrorType? errorType}) {
    final tags = '[${options.extra['requestUuid']}]';

    if (errorType == DioErrorType.connectTimeout) {
      _logger.network(
        '$tags <-- ${options.method} Connect Timeout',
        level: Level.WARNING,
      );
    } else if (response != null) {
      String? body;
      final location = response.headers['Location']?.firstWhere((uri) => true, orElse: () => '');

      if (response.statusCode! >= 300 && response.statusCode! <= 399 && location != null && location.isNotEmpty) {
        body = '(redirected to $location)';
      } else if (response.data != null) {
        body = response.data.toString();

        if (options.extra[Api.kPrivateResponseBody] == true) {
          body = '(private body with ${body.length} bytes)';
        } else if (options.responseType == ResponseType.bytes || options.responseType == ResponseType.stream) {
          body = '(${body.length} bytes)';
        }
      }

      _logger.network('$tags <-- ${options.method} ${response.statusCode} ${options.uri}', extra: body);
    } else {
      _logger.network('$tags <-- ${options.method} No Internet ${options.uri} - DNS not found', level: Level.WARNING);
    }
  }
}
