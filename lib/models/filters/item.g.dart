// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemFilters _$ItemFiltersFromJson(Map<String, dynamic> json) {
  return ItemFilters(
    type: _$enumDecodeNullable(_$ItemTypeEnumMap, json['type']),
    search: json['search'] as String?,
  );
}

Map<String, dynamic> _$ItemFiltersToJson(ItemFilters instance) =>
    <String, dynamic>{
      'type': instance.type,
      'search': instance.search,
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

const _$ItemTypeEnumMap = {
  ItemType.unknown: 'unknown',
  ItemType.all: 'all',
  ItemType.apparel: 'apparel',
  ItemType.hotel: 'hotel',
  ItemType.jewel: 'jewel',
  ItemType.makeup: 'makeup',
  ItemType.restaurant: 'restaurant',
};
