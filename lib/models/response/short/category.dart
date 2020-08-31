import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryShort {
  final String id;
  final String name;
  final String slug;
  @JsonKey(name: 'thumbnail_url')
  final String thumbnailUrl;

  CategoryShort({this.id, this.name, this.slug, this.thumbnailUrl});

  factory CategoryShort.fromJson(Map<String, dynamic> json) => _$CategoryShortFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryShortToJson(this);
}
