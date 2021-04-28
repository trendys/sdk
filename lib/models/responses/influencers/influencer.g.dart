// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'influencer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfluencerPartial _$InfluencerPartialFromJson(Map<String, dynamic> json) {
  return InfluencerPartial(
    id: json['id'] as String,
    name: json['name'] as String,
    displayName: json['display_name'] as String,
    country: json['country'] as String,
    actions: (json['actions'] as List<dynamic>)
        .map((e) => Action.fromJson(e as Map<String, dynamic>))
        .toList(),
    avatarUrl: json['avatar_url'] as String?,
  );
}

Map<String, dynamic> _$InfluencerPartialToJson(InfluencerPartial instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'display_name': instance.displayName,
      'avatar_url': instance.avatarUrl,
      'country': instance.country,
      'actions': instance.actions,
    };
