// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Point _$PointFromJson(Map<String, dynamic> json) => Point(
      x: json['x'] as String,
      y: json['y'] as String,
      affiliate: Affiliate.fromJson(json['affiliate'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$PointToJson(Point instance) => <String, dynamic>{
      'id': instance.id,
      'x': instance.x,
      'y': instance.y,
      'affiliate': instance.affiliate,
    };
