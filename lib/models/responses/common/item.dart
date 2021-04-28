import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/item_type.dart';
import 'package:trendys_sdk/models/responses/brands/brand.dart';
import 'package:trendys_sdk/models/responses/common/componening.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  Item({
    required this.id,
    required this.price,
    required this.currency,
    required this.type,
    required this.imageUrls,
    required this.brands,
    required this.componenings,
    this.name,
    this.description,
    this.city,
    this.country,
  });

  final String id;
  final String? name;
  final String? description;
  final double price;
  final String currency;
  @JsonKey(unknownEnumValue: ItemType.unknown)
  final ItemType type;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;
  final String? city;
  final String? country;
  final List<BrandPartial> brands;
  final List<Componening> componenings;

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
