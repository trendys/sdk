import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/providers/point/point_provider.dart';

class PointRepository {
  PointRepository({
    required PointProvider pointProvider,
  }) : _pointProvider = pointProvider;

  PointProvider _pointProvider;

  Future<Destroy> destroy(String pointId) async {
    return _pointProvider.destroy(pointId);
  }
}
