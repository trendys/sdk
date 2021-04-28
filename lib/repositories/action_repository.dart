import 'package:trendys_sdk/models/responses/common/destroy.dart';
import 'package:trendys_sdk/providers/action/action_provider.dart';

class ActionRepository {
  ActionRepository({
    required ActionProvider actionProvider,
  }) : _actionProvider = actionProvider;

  ActionProvider _actionProvider;

  Future<Destroy> destroy(String actionId) async {
    return _actionProvider.destroy(actionId);
  }
}
