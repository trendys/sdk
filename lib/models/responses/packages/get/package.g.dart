// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Package _$PackageFromJson(Map<String, dynamic> json) => Package(
      id: json['id'] as String,
      type: $enumDecode(_$PackageTypeEnumMap, json['type'],
          unknownValue: PackageType.unknown),
      claps: json['claps'] as int,
      favorites: json['favorites'] as int,
      images: (json['images'] as List<dynamic>)
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      actions: (json['actions'] as List<dynamic>)
          .map((e) => Action.fromJson(e as Map<String, dynamic>))
          .toList(),
      influencer: InfluencerPartial.fromJson(
          json['influencer'] as Map<String, dynamic>),
      categorizings: (json['categorizings'] as List<dynamic>)
          .map((e) => Categorizing.fromJson(e as Map<String, dynamic>))
          .toList(),
      gender: $enumDecodeNullable(_$PackageGenderEnumMap, json['gender'],
          unknownValue: PackageGender.unknown),
      feedback: json['feedback'] as String?,
      state: $enumDecodeNullable(_$PackageStateEnumMap, json['state'],
          unknownValue: PackageState.unknown),
    );

Map<String, dynamic> _$PackageToJson(Package instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$PackageTypeEnumMap[instance.type],
      'state': _$PackageStateEnumMap[instance.state],
      'claps': instance.claps,
      'favorites': instance.favorites,
      'gender': _$PackageGenderEnumMap[instance.gender],
      'feedback': instance.feedback,
      'influencer': instance.influencer,
      'actions': instance.actions,
      'categorizings': instance.categorizings,
      'images': instance.images,
    };

const _$PackageTypeEnumMap = {
  PackageType.unknown: 'unknown',
  PackageType.all: 'all',
  PackageType.outfit: 'outfit',
  PackageType.room: 'room',
  PackageType.trip: 'trip',
};

const _$PackageGenderEnumMap = {
  PackageGender.unknown: 'unknown',
  PackageGender.all: 'all',
  PackageGender.women: 'women',
  PackageGender.man: 'man',
  PackageGender.mixed: 'mixed',
};

const _$PackageStateEnumMap = {
  PackageState.unknown: 'unknown',
  PackageState.visible: 'visible',
  PackageState.invisible: 'invisible',
  PackageState.blocked: 'blocked',
};
