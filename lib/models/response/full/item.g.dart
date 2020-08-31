// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) {
  return Item(
    id: json['id'] as String,
    name: json['name'] as String,
    description: json['description'] as String,
    price: (json['price'] as num)?.toDouble(),
    currency: json['currency'] as String,
    type: json['type'] as String,
    imageUrls: (json['image_urls'] as List)?.map((e) => e as String)?.toList(),
    city: json['city'] as String,
    country: json['country'] as String,
    brands: (json['brands'] as List)
        ?.map((e) =>
            e == null ? null : BrandShort.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    categorizings: (json['categorizings'] as List)
        ?.map((e) =>
            e == null ? null : Categorizing.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'currency': instance.currency,
      'type': instance.type,
      'image_urls': instance.imageUrls,
      'city': instance.city,
      'country': instance.country,
      'brands': instance.brands,
      'categorizings': instance.categorizings,
    };
