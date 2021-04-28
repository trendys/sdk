import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';

part 'action_provider.g.dart';

@RestApi()
abstract class ActionProvider {
  factory ActionProvider(Dio dio, {String baseUrl}) = _ActionProvider;

  @DELETE('/action/{id}')
  Future<Destroy> destroy(@Path('id') String actionId);
}
