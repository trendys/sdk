import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/short/category.dart';

part 'categorizing.g.dart';

@JsonSerializable()
class Categorizing {
  final String id;
  final CategoryShort category;

  Categorizing({this.id, this.category});

  factory Categorizing.fromJson(Map<String, dynamic> json) => _$CategorizingFromJson(json);

  Map<String, dynamic> toJson() => _$CategorizingToJson(this);
}
