// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guest _$GuestFromJson(Map<String, dynamic> json) => Guest(
      id: json['id'] as String,
    );

Map<String, dynamic> _$GuestToJson(Guest instance) => <String, dynamic>{
      'id': instance.id,
    };

GuestCreate _$GuestCreateFromJson(Map<String, dynamic> json) => GuestCreate(
      guest: Guest.fromJson(json['guest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GuestCreateToJson(GuestCreate instance) =>
    <String, dynamic>{
      'guest': instance.guest,
    };
