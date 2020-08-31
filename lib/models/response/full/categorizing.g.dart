// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorizing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorizing _$CategorizingFromJson(Map<String, dynamic> json) {
  return Categorizing(
    id: json['id'] as String,
    category: json['category'] == null
        ? null
        : CategoryShort.fromJson(json['category'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CategorizingToJson(Categorizing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
    };
