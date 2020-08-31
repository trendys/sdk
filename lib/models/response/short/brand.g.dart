// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandShort _$BrandShortFromJson(Map<String, dynamic> json) {
  return BrandShort(
    id: json['id'] as String,
    name: json['name'] as String,
    logoUrl: json['logo_url'] as String,
  );
}

Map<String, dynamic> _$BrandShortToJson(BrandShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
    };
