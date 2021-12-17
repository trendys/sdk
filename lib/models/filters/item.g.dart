// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemFilters _$ItemFiltersFromJson(Map<String, dynamic> json) => ItemFilters(
      type: $enumDecodeNullable(_$ItemTypeEnumMap, json['type']),
      search: json['search'] as String?,
    );

Map<String, dynamic> _$ItemFiltersToJson(ItemFilters instance) =>
    <String, dynamic>{
      'type': instance.type,
      'search': instance.search,
    };

const _$ItemTypeEnumMap = {
  ItemType.unknown: 'unknown',
  ItemType.all: 'all',
  ItemType.apparel: 'apparel',
  ItemType.hotel: 'hotel',
  ItemType.jewel: 'jewel',
  ItemType.makeup: 'makeup',
  ItemType.restaurant: 'restaurant',
};
