import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/item_type.dart';

part 'item.g.dart';

@JsonSerializable()
class ItemFilters {
  ItemFilters({
    ItemType? type,
    this.search,
  }) : type = type == null || type == ItemType.unknown || type == ItemType.all ? null : type.toString().split('.').last;

  final String? type;
  final String? search;

  factory ItemFilters.fromJson(Map<String, dynamic> json) => _$ItemFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$ItemFiltersToJson(this);
}
