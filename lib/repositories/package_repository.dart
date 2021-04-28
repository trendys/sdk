import 'package:trendys_sdk/models/filters/package.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/models/responses/common/image.dart';
import 'package:trendys_sdk/models/responses/packages/get/package.dart';
import 'package:trendys_sdk/models/responses/packages/list/package.dart';
import 'package:trendys_sdk/providers/package/package_provider.dart';
import 'package:trendys_sdk/repositories/filterable_repository.dart';

class PackageRepository with FilterableRepository {
  PackageRepository({
    required PackageProvider packageProvider,
  }) : _packageProvider = packageProvider;

  PackageProvider _packageProvider;

  Future<HttpResponse<List<PackagePartial>>> list({PaginateFilters? paginate, PackageFilters? filters}) async {
    return _packageProvider.list(paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }

  Future<Package> get(String packageId) async {
    return _packageProvider.get(packageId);
  }

  Future<Destroy> destroy(String packageId) async {
    return _packageProvider.destroy(packageId);
  }

  Future<HttpResponse<List<Image>>> images(String packageId) async {
    return _packageProvider.images(packageId);
  }

  Future<Action> clap(String packageId) async {
    return _packageProvider.clap(packageId);
  }
}
