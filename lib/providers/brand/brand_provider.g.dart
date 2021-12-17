// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_provider.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _BrandProvider implements BrandProvider {
  _BrandProvider(this._dio, {this.baseUrl});

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<Brand>>> list({paginate, filters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'filters': filters};
    queryParameters.addAll(paginate?.toJson() ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<Brand>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/brands',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Brand.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<Brand> get(brandId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Brand>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/brands/${brandId}',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Brand.fromJson(_result.data!);
    return value;
  }

  @override
  Future<HttpResponse<List<Item>>> items(brandId, {paginate, filters}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'filters': filters};
    queryParameters.addAll(paginate?.toJson() ?? <String, dynamic>{});
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<HttpResponse<List<Item>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/brands/${brandId}/items',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Item.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
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
