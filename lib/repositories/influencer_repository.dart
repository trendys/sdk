import 'package:trendys_sdk/models/filters/influencer.dart';
import 'package:trendys_sdk/models/filters/package.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/models/responses/common/wallet.dart';
import 'package:trendys_sdk/models/responses/influencers/get/influencer.dart';
import 'package:trendys_sdk/models/responses/influencers/list/influencer.dart';
import 'package:trendys_sdk/models/responses/packages/list/package.dart';
import 'package:trendys_sdk/providers/action/action_provider.dart';
import 'package:trendys_sdk/providers/influencer/influencer_provider.dart';
import 'package:trendys_sdk/repositories/filterable_repository.dart';

class InfluencerRepository with FilterableRepository {
  InfluencerRepository({
    required InfluencerProvider influencerProvider,
    required ActionProvider actionProvider,
  })  : _influencerProvider = influencerProvider,
        _actionProvider = actionProvider;

  InfluencerProvider _influencerProvider;
  ActionProvider _actionProvider;

  Future<HttpResponse<List<InfluencerPartial>>> list({
    PaginateFilters? paginate,
    InfluencerFilters? filters,
  }) async {
    return _influencerProvider.list(paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }

  Future<Influencer> get(String influencerId) async {
    return _influencerProvider.get(influencerId);
  }

  Future<HttpResponse<List<Wallet>>> wallets(String influencerId, {PaginateFilters? paginate}) async {
    return _influencerProvider.wallets(influencerId, paginate: paginate);
  }

  Future<HttpResponse<List<PackagePartial>>> packages(
    String influencerId, {
    PaginateFilters? paginate,
    PackageFilters? filters,
  }) async {
    return _influencerProvider.packages(influencerId, paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }

  Future<Action> follow(String influencerId) async {
    return _influencerProvider.follow(influencerId);
  }

  Future<Destroy> unfollow(String actionId) async {
    return _actionProvider.destroy(actionId);
  }
}
