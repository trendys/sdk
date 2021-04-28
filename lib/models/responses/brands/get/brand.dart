import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/brands/brand.dart';

part 'brand.g.dart';

@JsonSerializable()
class Brand extends BrandPartial {
  Brand({
    required String id,
    required String? name,
    required String logoUrl,
    this.description,
  }) : super(
          id: id,
          name: name,
          logoUrl: logoUrl,
        );

  final String? description;

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  Map<String, dynamic> toJson() => _$BrandToJson(this);
}
