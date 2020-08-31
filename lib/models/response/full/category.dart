import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/short/category.dart' show CategoryShort;

part 'category.g.dart';

@JsonSerializable()
class CategoryFull {
  final String id;
  final String name;
  final String slug;
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;
  final List<CategoryShort> children;

  CategoryFull({this.id, this.name, this.slug, this.thumbnailUrl, this.children});

  factory CategoryFull.fromJson(Map<String, dynamic> json) => _$CategoryFullFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryFullToJson(this);
}
