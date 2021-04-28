// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    id: json['id'] as String,
    lastActivityAt: DateTime.parse(json['last_activity_at'] as String),
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'last_activity_at': instance.lastActivityAt.toIso8601String(),
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };
