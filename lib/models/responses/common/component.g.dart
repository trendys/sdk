// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Component _$ComponentFromJson(Map<String, dynamic> json) => Component(
      id: json['id'] as String,
      type: $enumDecode(_$ComponentTypeEnumMap, json['type'],
          unknownValue: ComponentType.unknown),
      name: json['name'] as String?,
      iconUrl: json['icon_url'] as String?,
    );

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ComponentTypeEnumMap[instance.type],
      'name': instance.name,
      'icon_url': instance.iconUrl,
    };

const _$ComponentTypeEnumMap = {
  ComponentType.unknown: 'unknown',
  ComponentType.all: 'all',
  ComponentType.category: 'category',
  ComponentType.color: 'color',
};
