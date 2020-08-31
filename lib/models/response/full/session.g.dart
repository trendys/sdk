// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionFull _$SessionFullFromJson(Map<String, dynamic> json) {
  return SessionFull(
    id: json['id'] as String,
    accessToken: json['access_token'] as String,
    refreshToken: json['refresh_token'] as String,
    lastActivityAt: json['last_activity_at'] as String,
    expiredAt: json['expired_at'] as String,
    ips: (json['ips'] as List)?.map((e) => e as String)?.toList(),
    userAgents:
        (json['user_agents'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$SessionFullToJson(SessionFull instance) =>
    <String, dynamic>{
      'id': instance.id,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'last_activity_at': instance.lastActivityAt,
      'expired_at': instance.expiredAt,
      'ips': instance.ips,
      'user_agents': instance.userAgents,
    };
