// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChildCategory _$ChildCategoryFromJson(Map<String, dynamic> json) {
  return ChildCategory(
    id: json['id'] as String,
    slug: json['slug'] as String,
    name: json['name'] as String?,
    thumbnailUrl: json['thumbnail_url'] as String?,
  );
}

Map<String, dynamic> _$ChildCategoryToJson(ChildCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumbnail_url': instance.thumbnailUrl,
    };
