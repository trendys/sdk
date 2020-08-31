// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'affiliate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Affiliate _$AffiliateFromJson(Map<String, dynamic> json) {
  return Affiliate(
    url: json['url'] as String,
    item: json['item'] == null
        ? null
        : Item.fromJson(json['item'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AffiliateToJson(Affiliate instance) => <String, dynamic>{
      'url': instance.url,
      'item': instance.item,
    };
