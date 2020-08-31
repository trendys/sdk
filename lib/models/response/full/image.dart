import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/point.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  final String id;
  final String url;
  final List<Point> points;

  Image({this.id, this.url, this.points});

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
