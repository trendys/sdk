// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categorizing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Categorizing _$CategorizingFromJson(Map<String, dynamic> json) => Categorizing(
      category:
          CategoryPartial.fromJson(json['category'] as Map<String, dynamic>),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CategorizingToJson(Categorizing instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category': instance.category,
    };
