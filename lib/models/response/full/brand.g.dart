// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandFull _$BrandFullFromJson(Map<String, dynamic> json) {
  return BrandFull(
    id: json['id'] as String,
    name: json['name'] as String,
    logoUrl: json['logo_url'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$BrandFullToJson(BrandFull instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
      'description': instance.description,
    };
