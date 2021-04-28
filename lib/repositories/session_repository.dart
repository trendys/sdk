import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/sessions/list/session.dart';
import 'package:trendys_sdk/providers/session/session_provider.dart';

class SessionRepository {
  SessionRepository({
    required SessionProvider sessionProvider,
  }) : _sessionProvider = sessionProvider;

  SessionProvider _sessionProvider;

  Future<HttpResponse<List<Session>>> list({PaginateFilters? paginate}) async {
    return _sessionProvider.list();
  }
}
