import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/providers/categorizing/categorizing_provider.dart';

class CategorizingRepository {
  CategorizingRepository({
    required CategorizingProvider categorizingProvider,
  }) : _categorizingProvider = categorizingProvider;

  CategorizingProvider _categorizingProvider;

  Future<Destroy> destroy(categorizingId) async {
    return _categorizingProvider.destroy(categorizingId);
  }
}
