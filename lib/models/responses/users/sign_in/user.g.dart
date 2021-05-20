// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    email: json['email'] as String,
    name: json['name'] as String,
    displayName: json['display_name'] as String,
    avatarUrl: json['avatar_url'] as String,
    country: json['country'] as String,
    genderInterested: _$enumDecode(
        _$UserGenderEnumMap, json['gender_interested'],
        unknownValue: UserGender.unknown),
    session: Session.fromJson(json['session'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'country': instance.country,
      'gender_interested': _$UserGenderEnumMap[instance.genderInterested],
      'session': instance.session,
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

const _$UserGenderEnumMap = {
  UserGender.unknown: 'unknown',
  UserGender.women: 'women',
  UserGender.man: 'man',
  UserGender.notDefined: 'not_defined',
};
