// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthenticationProvider implements AuthenticationProvider {
  _AuthenticationProvider(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Guest> guestSignIn({guest}) async {
    const _extra = <String, dynamic>{
      'private_request_body': false,
      'private_response_body': true
    };
    final queryParameters = <String, dynamic>{};
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(guest?.toJson() ?? <String, dynamic>{});
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Guest>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/guests/sign_in',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Guest.fromJson(_result.data!);
    return value;
  }

  @override
  Future<User> userSignIn(body) async {
    const _extra = <String, dynamic>{
      'private_request_body': true,
      'private_response_body': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(body.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'POST', headers: _headers, extra: _extra)
            .compose(_dio.options, '/users/sign_in',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
    return value;
  }

  @override
  Future<Session> refreshToken(session) async {
    const _extra = <String, dynamic>{
      'private_request_body': true,
      'private_response_body': true
    };
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(session.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Session>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/sessions',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Session.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
