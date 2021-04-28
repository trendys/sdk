// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'component.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Component _$ComponentFromJson(Map<String, dynamic> json) {
  return Component(
    id: json['id'] as String,
    type: _$enumDecode(_$ComponentTypeEnumMap, json['type'],
        unknownValue: ComponentType.unknown),
    name: json['name'] as String?,
    iconUrl: json['icon_url'] as String?,
  );
}

Map<String, dynamic> _$ComponentToJson(Component instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ComponentTypeEnumMap[instance.type],
      'name': instance.name,
      'icon_url': instance.iconUrl,
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

const _$ComponentTypeEnumMap = {
  ComponentType.unknown: 'unknown',
  ComponentType.all: 'all',
  ComponentType.category: 'category',
  ComponentType.color: 'color',
};
