// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandPartial _$BrandPartialFromJson(Map<String, dynamic> json) {
  return BrandPartial(
    id: json['id'] as String,
    name: json['name'] as String?,
    logoUrl: json['logo_url'] as String?,
  );
}

Map<String, dynamic> _$BrandPartialToJson(BrandPartial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_url': instance.logoUrl,
    };
