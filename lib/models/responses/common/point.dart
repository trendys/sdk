import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/affiliate.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  Point({
    required this.x,
    required this.y,
    required this.affiliate,
    this.id,
  });

  final String? id;
  final String x;
  final String y;
  final Affiliate affiliate;

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}
