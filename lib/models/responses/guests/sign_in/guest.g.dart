// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      id: json['id'] as String,
      session: Session.fromJson(json['session'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'id': instance.id,
      'session': instance.session,
    };
