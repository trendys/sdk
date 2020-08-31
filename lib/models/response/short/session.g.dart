// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionShort _$SessionShortFromJson(Map<String, dynamic> json) {
  return SessionShort(
    id: json['id'] as String,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
    lastActivityAt: json['last_activity_at'] as String,
  );
}

Map<String, dynamic> _$SessionShortToJson(SessionShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'last_activity_at': instance.lastActivityAt,
    };
