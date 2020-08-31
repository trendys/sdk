import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/affiliate.dart';

part 'point.g.dart';

@JsonSerializable()
class Point {
  final String id;
  final String x;
  final String y;
  final Affiliate affiliate;

  Point({this.id, this.x, this.y, this.affiliate});

  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);

  Map<String, dynamic> toJson() => _$PointToJson(this);
}
