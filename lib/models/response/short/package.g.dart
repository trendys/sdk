// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PackageShort _$PackageShortFromJson(Map<String, dynamic> json) {
  return PackageShort(
    id: json['id'] as String,
    type: json['type'] as String,
    state: json['state'] as String,
    gender: json['gender'] as String,
    claps: json['claps'] as int,
    favorites: json['favorites'] as int,
    influencer: json['influencer'] == null
        ? null
        : InfluencerShort.fromJson(json['influencer'] as Map<String, dynamic>),
    categorizings: (json['categorizings'] as List)
        ?.map((e) =>
            e == null ? null : Categorizing.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    actions: (json['actions'] as List)
        ?.map((e) =>
            e == null ? null : Action.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    imageUrls: (json['image_urls'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$PackageShortToJson(PackageShort instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'state': instance.state,
      'gender': instance.gender,
      'claps': instance.claps,
      'favorites': instance.favorites,
      'influencer': instance.influencer,
      'categorizings': instance.categorizings,
      'actions': instance.actions,
      'image_urls': instance.imageUrls,
    };
