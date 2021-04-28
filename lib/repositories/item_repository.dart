import 'package:trendys_sdk/models/filters/item.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/item.dart';
import 'package:trendys_sdk/providers/item/item_provider.dart';
import 'package:trendys_sdk/repositories/filterable_repository.dart';

class ItemRepository with FilterableRepository {
  ItemRepository({
    required ItemProvider itemProvider,
  }) : _itemProvider = itemProvider;

  ItemProvider _itemProvider;

  Future<HttpResponse<List<Item>>> list({PaginateFilters? paginate, ItemFilters? filters}) async {
    return _itemProvider.list(paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }

  Future<Item> get(String itemId) async {
    return _itemProvider.get(itemId);
  }
}
