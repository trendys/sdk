// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String,
      price: (json['price'] as num).toDouble(),
      currency: json['currency'] as String,
      type: $enumDecode(_$ItemTypeEnumMap, json['type'],
          unknownValue: ItemType.unknown),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      brands: (json['brands'] as List<dynamic>)
          .map((e) => BrandPartial.fromJson(e as Map<String, dynamic>))
          .toList(),
      componenings: (json['componenings'] as List<dynamic>)
          .map((e) => Componening.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'type': _$ItemTypeEnumMap[instance.type],
      'image_urls': instance.imageUrls,
      'city': instance.city,
      'country': instance.country,
      'brands': instance.brands,
      'componenings': instance.componenings,
    };

const _$ItemTypeEnumMap = {
  ItemType.unknown: 'unknown',
  ItemType.all: 'all',
  ItemType.apparel: 'apparel',
  ItemType.hotel: 'hotel',
  ItemType.jewel: 'jewel',
  ItemType.makeup: 'makeup',
  ItemType.restaurant: 'restaurant',
};
