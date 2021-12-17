// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageFilters _$PackageFiltersFromJson(Map<String, dynamic> json) =>
    PackageFilters(
      type: $enumDecodeNullable(_$PackageTypeEnumMap, json['type']),
      trends: json['trends'] as bool?,
      gender: $enumDecodeNullable(_$PackageGenderEnumMap, json['gender']),
      city: json['city'] as String?,
    );

Map<String, dynamic> _$PackageFiltersToJson(PackageFilters instance) =>
    <String, dynamic>{
      'type': instance.type,
      'trends': instance.trends,
      'gender': instance.gender,
      'city': instance.city,
    };

const _$PackageTypeEnumMap = {
  PackageType.unknown: 'unknown',
  PackageType.all: 'all',
  PackageType.outfit: 'outfit',
  PackageType.room: 'room',
  PackageType.trip: 'trip',
};

const _$PackageGenderEnumMap = {
  PackageGender.unknown: 'unknown',
  PackageGender.all: 'all',
  PackageGender.women: 'women',
  PackageGender.man: 'man',
  PackageGender.mixed: 'mixed',
};
