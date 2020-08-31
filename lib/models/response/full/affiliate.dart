import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/item.dart';

part 'affiliate.g.dart';

@JsonSerializable()
class Affiliate {
  final String url;
  final Item item;

  Affiliate({this.url, this.item});

  factory Affiliate.fromJson(Map<String, dynamic> json) => _$AffiliateFromJson(json);

  Map<String, dynamic> toJson() => _$AffiliateToJson(this);
}
