import 'package:json_annotation/json_annotation.dart';

part 'brand.g.dart';

@JsonSerializable()
class BrandFilters {
  const BrandFilters({
    this.search,
  });

  final String? search;

  factory BrandFilters.fromJson(Map<String, dynamic> json) => _$BrandFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$BrandFiltersToJson(this);
}
