// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'influencer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfluencerFull _$InfluencerFullFromJson(Map<String, dynamic> json) {
  return InfluencerFull(
    id: json['id'] as String,
    name: json['name'] as String,
    displayName: json['display_name'] as String,
    avatarUrl: json['avatar_url'] as String,
    actions: (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    genderPreferred: json['gender_preferred'] as String,
    state: json['state'] as String,
    wallets: (json['wallets'] as List)
        ?.map((e) =>
            e == null ? null : Wallet.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    description: json['description'] as String,
    followers: json['followers'] as int,
    packages: json['packages'] as int,
  );
}

Map<String, dynamic> _$InfluencerFullToJson(InfluencerFull instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'gender_preferred': instance.genderPreferred,
      'actions': instance.actions,
      'state': instance.state,
      'wallets': instance.wallets,
      'description': instance.description,
      'followers': instance.followers,
      'packages': instance.packages,
    };
