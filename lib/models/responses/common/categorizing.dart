import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/categories/category.dart';

part 'categorizing.g.dart';

@JsonSerializable()
class Categorizing {
  Categorizing({
    required this.category,
    this.id,
  });

  final String? id;
  final CategoryPartial category;

  factory Categorizing.fromJson(Map<String, dynamic> json) => _$CategorizingFromJson(json);

  Map<String, dynamic> toJson() => _$CategorizingToJson(this);
}
