import 'package:trendys_sdk/models/filters/brand.dart';
import 'package:trendys_sdk/models/filters/item.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/brands/get/brand.dart';
import 'package:trendys_sdk/models/responses/common/item.dart';
import 'package:trendys_sdk/providers/brand/brand_provider.dart';
import 'package:trendys_sdk/repositories/filterable_repository.dart';

class BrandRepository with FilterableRepository {
  BrandRepository({
    required BrandProvider brandProvider,
  }) : _brandProvider = brandProvider;

  BrandProvider _brandProvider;

  Future<HttpResponse<List<Brand>>> list({PaginateFilters? paginate, BrandFilters? filters}) async {
    return _brandProvider.list(paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }

  Future<Brand> get(String brandId) async {
    return _brandProvider.get(brandId);
  }

  Future<HttpResponse<List<Item>>> items(String brandId, {PaginateFilters? paginate, ItemFilters? filters}) async {
    return _brandProvider.items(brandId, paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }
}
