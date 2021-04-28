import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/categories/child.dart';

part 'category.g.dart';

@JsonSerializable()
class Category extends ChildCategory {
  Category({
    required String id,
    required String slug,
    required String name,
    required this.children,
    String? thumbnailUrl,
  }) : super(
          id: id,
          slug: slug,
          name: name,
          thumbnailUrl: thumbnailUrl,
        );

  final List<ChildCategory> children;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}
