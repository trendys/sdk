import 'package:trendys_sdk/models/filters/paginate.dart';
import 'package:trendys_sdk/models/http_response.dart';
import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/models/responses/suggested_Items/list/suggested_item.dart';
import 'package:trendys_sdk/providers/image/image_provider.dart';

class ImageRepository {
  ImageRepository({
    required ImageProvider imageProvider,
  }) : _imageProvider = imageProvider;

  ImageProvider _imageProvider;

  Future<Destroy> destroy(String imageId) async {
    return _imageProvider.destroy(imageId);
  }

  Future<HttpResponse<List<SuggestedItem>>> suggestedItems(String imageId, {PaginateFilters? paginate}) async {
    return _imageProvider.suggestedItems(imageId, paginate: paginate);
  }
}
