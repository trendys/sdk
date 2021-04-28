import 'package:trendys_sdk/models/filters/component.dart';
import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/component.dart';
import 'package:trendys_sdk/providers/component/component_provider.dart';
import 'package:trendys_sdk/repositories/filterable_repository.dart';

class ComponentRepository with FilterableRepository {
  ComponentRepository({
    required ComponentProvider componentProvider,
  }) : _componentProvider = componentProvider;

  ComponentProvider _componentProvider;

  Future<HttpResponse<List<Component>>> list({PaginateFilters? paginate, ComponentFilters? filters}) async {
    return _componentProvider.list(paginate: paginate, filters: purgeFilters(filters?.toJson()));
  }

  Future<Component> get(String categoryId) async {
    return _componentProvider.get(categoryId);
  }
}
