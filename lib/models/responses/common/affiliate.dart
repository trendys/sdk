import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/item.dart';

part 'affiliate.g.dart';

@JsonSerializable()
class Affiliate {
  Affiliate({
    required this.url,
    required this.item,
  });

  final String url;
  final Item item;

  factory Affiliate.fromJson(Map<String, dynamic> json) => _$AffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$AffiliateToJson(this);
}
