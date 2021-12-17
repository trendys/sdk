// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      email: json['email'] as String?,
      name: json['name'] as String?,
      displayName: json['display_name'] as String?,
      avatarUrl: json['avatar_url'] as String?,
      country: json['country'] as String?,
      genderInterested: $enumDecodeNullable(
          _$UserGenderEnumMap, json['gender_interested'],
          unknownValue: UserGender.unknown),
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'country': instance.country,
      'gender_interested': _$UserGenderEnumMap[instance.genderInterested],
    };

const _$UserGenderEnumMap = {
  UserGender.unknown: 'unknown',
  UserGender.women: 'women',
  UserGender.man: 'man',
  UserGender.notDefined: 'not_defined',
};
