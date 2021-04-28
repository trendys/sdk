// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentFilters _$ComponentFiltersFromJson(Map<String, dynamic> json) {
  return ComponentFilters(
    type: _$enumDecodeNullable(_$ComponentTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$ComponentFiltersToJson(ComponentFilters instance) =>
    <String, dynamic>{
      'type': instance.type,
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

const _$ComponentTypeEnumMap = {
  ComponentType.unknown: 'unknown',
  ComponentType.all: 'all',
  ComponentType.category: 'category',
  ComponentType.color: 'color',
};
