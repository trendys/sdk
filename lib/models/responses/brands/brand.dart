import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class BrandPartial {
  BrandPartial({
    required this.id,
    required this.name,
    required this.logoUrl,
  });

  final String id;
  final String? name;
  @JsonKey(name: 'logo_url')
  final String? logoUrl;

  factory BrandPartial.fromJson(Map<String, dynamic> json) => _$BrandPartialFromJson(json);

  Map<String, dynamic> toJson() => _$BrandPartialToJson(this);
}
