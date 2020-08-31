// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryShort _$CategoryShortFromJson(Map<String, dynamic> json) {
  return CategoryShort(
    id: json['id'] as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    thumbnailUrl: json['thumbnail_url'] as String,
  );
}

Map<String, dynamic> _$CategoryShortToJson(CategoryShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumbnail_url': instance.thumbnailUrl,
    };
