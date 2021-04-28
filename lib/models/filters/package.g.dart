// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageFilters _$PackageFiltersFromJson(Map<String, dynamic> json) {
  return PackageFilters(
    type: _$enumDecodeNullable(_$PackageTypeEnumMap, json['type']),
    trends: json['trends'] as bool?,
    gender: _$enumDecodeNullable(_$PackageGenderEnumMap, json['gender']),
    city: json['city'] as String?,
  );
}

Map<String, dynamic> _$PackageFiltersToJson(PackageFilters instance) =>
    <String, dynamic>{
      'type': instance.type,
      'trends': instance.trends,
      'gender': instance.gender,
      'city': instance.city,
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
};
