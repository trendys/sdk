// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComponentFilters _$ComponentFiltersFromJson(Map<String, dynamic> json) =>
    ComponentFilters(
      type: $enumDecodeNullable(_$ComponentTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$ComponentFiltersToJson(ComponentFilters instance) =>
    <String, dynamic>{
      'type': instance.type,
    };

const _$ComponentTypeEnumMap = {
  ComponentType.unknown: 'unknown',
  ComponentType.all: 'all',
  ComponentType.category: 'category',
  ComponentType.color: 'color',
};
