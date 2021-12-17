// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: json['id'] as String,
      slug: json['slug'] as String,
      name: json['name'] as String,
      children: (json['children'] as List<dynamic>)
          .map((e) => ChildCategory.fromJson(e as Map<String, dynamic>))
          .toList(),
      thumbnailUrl: json['thumbnail_url'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'thumbnail_url': instance.thumbnailUrl,
      'children': instance.children,
    };
