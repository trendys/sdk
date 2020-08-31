import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/categorizing.dart';
import 'package:trendys_sdk/models/response/short/brand.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  final String id;
  final String name;
  final String description;
  final double price;
  final String currency;
  final String type;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  final String city;
  final String country;
  final List<BrandShort> brands;
  final List<Categorizing> categorizings;

  Item({this.id, this.name, this.description, this.price, this.currency, this.type, this.imageUrls, this.city, this.country, this.brands, this.categorizings});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
