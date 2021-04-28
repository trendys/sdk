import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';

part 'point_provider.g.dart';

@RestApi()
abstract class PointProvider {
  factory PointProvider(Dio dio, {String baseUrl}) = _PointProvider;

  @DELETE('/points/{id}')
  Future<Destroy> destroy(@Path('id') String pointId);
}
