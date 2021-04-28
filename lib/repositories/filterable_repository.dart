import 'package:meta/meta.dart';

abstract class FilterableRepository {
  @protected
  Map<String, dynamic>? purgeFilters(Map<String, dynamic>? params) {
    if (params == null || params.isEmpty) return null;

    return params.map((key, value) {
      if (value is Map<String, dynamic>) {
        final newValue = purgeFilters(value);

        return MapEntry(key, newValue);
      } else {
        return MapEntry(key, value);
      }
    })
      ..removeWhere((key, value) => value == null);
  }
}
