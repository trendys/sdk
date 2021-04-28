// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suggested_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuggestedItem _$SuggestedItemFromJson(Map<String, dynamic> json) {
  return SuggestedItem(
    item: Item.fromJson(json['item'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SuggestedItemToJson(SuggestedItem instance) =>
    <String, dynamic>{
      'item': instance.item,
    };
