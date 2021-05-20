// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'influencer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfluencerFilters _$InfluencerFiltersFromJson(Map<String, dynamic> json) {
  return InfluencerFilters(
    genderPreferred: _$enumDecodeNullable(
        _$InfluencerGenderEnumMap, json['genderPreferred']),
    trends: json['trends'] as bool?,
  );
}

Map<String, dynamic> _$InfluencerFiltersToJson(InfluencerFilters instance) =>
    <String, dynamic>{
      'genderPreferred': instance.genderPreferred,
      'trends': instance.trends,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$InfluencerGenderEnumMap = {
  InfluencerGender.unknown: 'unknown',
  InfluencerGender.all: 'all',
  InfluencerGender.women: 'women',
  InfluencerGender.man: 'man',
  InfluencerGender.mixed: 'mixed',
};
