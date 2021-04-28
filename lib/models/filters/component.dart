import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/component_type.dart';
import 'package:trendys_sdk/enums/package_type.dart';

part 'component.g.dart';

@JsonSerializable()
class ComponentFilters {
  ComponentFilters({
    ComponentType? type,
  }) : type = type == null || type == ComponentType.unknown || type == ComponentType.all
            ? null
            : type.toString().split('.').last;

  final String? type;

  factory ComponentFilters.fromJson(Map<String, dynamic> json) => _$ComponentFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentFiltersToJson(this);
}
