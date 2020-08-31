// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryFull _$CategoryFullFromJson(Map<String, dynamic> json) {
  return CategoryFull(
    id: json['id'] as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    thumbnailUrl: json['thumbnail_url'] as String,
    children: (json['children'] as List)
        ?.map((e) => e == null
            ? null
            : CategoryShort.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CategoryFullToJson(CategoryFull instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumbnail_url': instance.thumbnailUrl,
      'children': instance.children,
    };
