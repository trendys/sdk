import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/categories/category.dart';

part 'child.g.dart';

@JsonSerializable()
class ChildCategory extends CategoryPartial {
  ChildCategory({
    required String id,
    required String slug,
    String? name,
    this.thumbnailUrl,
  }) : super(
          id: id,
          slug: slug,
          name: name,
        );

  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;

  factory ChildCategory.fromJson(Map<String, dynamic> json) => _$ChildCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$ChildCategoryToJson(this);
}
