import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/item.dart';

part 'suggested_item.g.dart';

@JsonSerializable()
class SuggestedItem {
  SuggestedItem({
    required this.item,
  });

  final Item item;

  factory SuggestedItem.fromJson(Map<String, dynamic> json) => _$SuggestedItemFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestedItemToJson(this);
}
