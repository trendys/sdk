import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/sessions/list/session.dart';

part 'session_provider.g.dart';

@RestApi()
abstract class SessionProvider {
  factory SessionProvider(Dio dio, {String baseUrl}) = _SessionProvider;

  @GET('/sessions')
  Future<HttpResponse<List<Session>>> list({
    @Queries() PaginateFilters? paginate,
  });
}
