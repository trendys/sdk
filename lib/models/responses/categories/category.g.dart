// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryPartial _$CategoryPartialFromJson(Map<String, dynamic> json) {
  return CategoryPartial(
    id: json['id'] as String,
    slug: json['slug'] as String,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$CategoryPartialToJson(CategoryPartial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
    };
