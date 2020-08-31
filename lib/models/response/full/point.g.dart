// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) {
  return Point(
    id: json['id'] as String,
    x: json['x'] as String,
    y: json['y'] as String,
    affiliate: json['affiliate'] == null
        ? null
        : Affiliate.fromJson(json['affiliate'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'affiliate': instance.affiliate,
    };
