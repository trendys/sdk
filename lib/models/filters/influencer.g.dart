// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'influencer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfluencerFilters _$InfluencerFiltersFromJson(Map<String, dynamic> json) =>
    InfluencerFilters(
      genderPreferred: $enumDecodeNullable(
          _$InfluencerGenderEnumMap, json['genderPreferred']),
      trends: json['trends'] as bool?,
    );

Map<String, dynamic> _$InfluencerFiltersToJson(InfluencerFilters instance) =>
    <String, dynamic>{
      'genderPreferred': instance.genderPreferred,
      'trends': instance.trends,
    };

const _$InfluencerGenderEnumMap = {
  InfluencerGender.unknown: 'unknown',
  InfluencerGender.all: 'all',
  InfluencerGender.women: 'women',
  InfluencerGender.man: 'man',
  InfluencerGender.mixed: 'mixed',
};
