import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class BrandFull {
  final String id;
  final String name;
  @JsonKey(name: 'logo_url')
  final String logoUrl;
  final String description;

  BrandFull({this.id, this.name, this.logoUrl, this.description});

  factory BrandFull.fromJson(Map<String, dynamic> json) => _$BrandFullFromJson(json);

  Map<String, dynamic> toJson() => _$BrandFullToJson(this);
}
