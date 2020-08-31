import 'dart:core';

import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class BrandShort {
  final String id;
  final String name;
  @JsonKey(name: 'logo_url')
  final String logoUrl;

  BrandShort({this.id, this.name, this.logoUrl});

  factory BrandShort.fromJson(Map<String, dynamic> json) => _$BrandShortFromJson(json);

  Map<String, dynamic> toJson() => _$BrandShortToJson(this);
}
