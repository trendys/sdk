// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'influencer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Influencer _$InfluencerFromJson(Map<String, dynamic> json) {
  return Influencer(
    id: json['id'] as String,
    name: json['name'] as String,
    displayName: json['display_name'] as String,
    country: json['country'] as String,
    actions: (json['actions'] as List<dynamic>)
        .map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    followers: json['followers'] as int,
    packages: json['packages'] as int,
    avatarUrl: json['avatar_url'] as String?,
    description: json['description'] as String?,
    genderPreferred: _$enumDecodeNullable(
        _$InfluencerGenderEnumMap, json['genderPreferred'],
        unknownValue: InfluencerGender.unknown),
    state: _$enumDecodeNullable(_$InfluencerStateEnumMap, json['state'],
        unknownValue: InfluencerState.unknown),
    wallets: (json['wallets'] as List<dynamic>?)
        ?.map((e) => Wallet.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$InfluencerToJson(Influencer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'country': instance.country,
      'actions': instance.actions,
      'description': instance.description,
      'followers': instance.followers,
      'packages': instance.packages,
      'genderPreferred': _$InfluencerGenderEnumMap[instance.genderPreferred],
      'state': _$InfluencerStateEnumMap[instance.state],
      'wallets': instance.wallets,
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$InfluencerGenderEnumMap = {
  InfluencerGender.unknown: 'unknown',
  InfluencerGender.all: 'all',
  InfluencerGender.women: 'women',
  InfluencerGender.man: 'man',
};

const _$InfluencerStateEnumMap = {
  InfluencerState.unknown: 'unknown',
  InfluencerState.draft: 'draft',
  InfluencerState.invisible: 'invisible',
  InfluencerState.visible: 'visible',
  InfluencerState.blocked: 'blocked',
};
