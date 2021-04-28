import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/point.dart';

part 'image.g.dart';

@JsonSerializable()
class Image {
  Image({
    required this.url,
    required this.points,
    this.id,
    this.state,
  });

  final String? id;
  final String url;
  final String? state;
  final List<Point> points;

  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

  Map<String, dynamic> toJson() => _$ImageToJson(this);
}
