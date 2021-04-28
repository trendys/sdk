import 'package:trendys_sdk/config/session_manager.dart';
import 'package:trendys_sdk/enums/user_type.dart';
import 'package:trendys_sdk/models/filters/influencer.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/influencers/get/influencer.dart';
import 'package:trendys_sdk/models/responses/sessions/list/session.dart';
import 'package:trendys_sdk/models/responses/users/get/user.dart';
import 'package:trendys_sdk/providers/session/session_provider.dart';
import 'package:trendys_sdk/providers/user/user_provider.dart';
import 'package:trendys_sdk/repositories/filterable_repository.dart';

class UserRepository with FilterableRepository {
  UserRepository({
    required UserProvider userProvider,
    required SessionProvider sessionProvider,
    required SessionManager sessionManager,
  })  : _userProvider = userProvider,
        _sessionProvider = sessionProvider,
        _sessionManager = sessionManager;

  UserProvider _userProvider;
  SessionProvider _sessionProvider;
  SessionManager _sessionManager;

  Future<String?> id() async {
    return _sessionManager.getId();
  }

  Future<UserType> type() async {
    return _sessionManager.getType();
  }

  Future<String?> accessToken() async {
    return _sessionManager.getAccessToken();
  }

  Future<String?> refreshToken() async {
    return _sessionManager.getRefreshToken();
  }

  Future<User> get(String userId) async {
    return _userProvider.get(userId);
  }

  Future<HttpResponse<List<Session>>> sessions({PaginateFilters? paginate}) async {
    return _sessionProvider.list();
  }

  Future<HttpResponse<List<Influencer>>> influencers(
    String userId, {
    PaginateFilters? paginate,
    InfluencerFilters? filters,
  }) async {
    return _userProvider.influencers(userId, paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }
}
