// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session(
    id: json['id'] as String,
    lastActivityAt: DateTime.parse(json['last_activity_at'] as String),
    expiredAt: json['expired_at'] == null
        ? null
        : DateTime.parse(json['expired_at'] as String),
    ips: (json['ips'] as List<dynamic>).map((e) => e as String).toList(),
    userAgents:
        (json['user_agents'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'id': instance.id,
      'last_activity_at': instance.lastActivityAt.toIso8601String(),
      'expired_at': instance.expiredAt?.toIso8601String(),
      'ips': instance.ips,
      'user_agents': instance.userAgents,
    };
