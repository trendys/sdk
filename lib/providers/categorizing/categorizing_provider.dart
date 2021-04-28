import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';

part 'categorizing_provider.g.dart';

@RestApi()
abstract class CategorizingProvider {
  factory CategorizingProvider(Dio dio, {String baseUrl}) = _CategorizingProvider;

  @DELETE('/categorizings/{id}')
  Future<Destroy> destroy(@Path('id') String categoryId);
}
