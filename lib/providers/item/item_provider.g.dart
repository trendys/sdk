// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ItemProvider implements ItemProvider {
  _ItemProvider(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<Item>>> list({paginate, filters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'filters': filters};
    queryParameters.addAll(paginate?.toJson() ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<Item>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Item.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<Item> get(itemId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<Item>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, '/items/${itemId}',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Item.fromJson(_result.data!);
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
