// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Action _$ActionFromJson(Map<String, dynamic> json) {
  return Action(
    id: json['id'] as String,
    type: json['type'] as String,
  );
}

Map<String, dynamic> _$ActionToJson(Action instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
    };
