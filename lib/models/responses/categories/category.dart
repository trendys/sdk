import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryPartial {
  CategoryPartial({
    required this.id,
    required this.slug,
    this.name,
  });

  final String id;
  final String? name;
  final String slug;

  factory CategoryPartial.fromJson(Map<String, dynamic> json) => _$CategoryPartialFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryPartialToJson(this);
}
