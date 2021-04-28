import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/categories/get/category.dart';
import 'package:trendys_sdk/models/responses/categories/category.dart';
import 'package:trendys_sdk/providers/category/category_provider.dart';

class CategoryRepository {
  CategoryRepository({
    required CategoryProvider categoryProvider,
  }) : _categoryProvider = categoryProvider;

  CategoryProvider _categoryProvider;

  Future<HttpResponse<List<CategoryPartial>>> list({PaginateFilters? paginate}) async {
    return _categoryProvider.list(paginate: paginate);
  }

  Future<Category> get(String categoryId) async {
    return _categoryProvider.get(categoryId);
  }
}
