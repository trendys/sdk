// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Image _$ImageFromJson(Map<String, dynamic> json) {
  return Image(
    url: json['url'] as String,
    points: (json['points'] as List<dynamic>)
        .map((e) => Point.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['id'] as String?,
    state: json['state'] as String?,
  );
}

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'state': instance.state,
      'points': instance.points,
    };
