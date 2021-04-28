import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/package_gender.dart';
import 'package:trendys_sdk/enums/package_type.dart';

part 'package.g.dart';

@JsonSerializable()
class PackageFilters {
  PackageFilters({
    PackageType? type,
    bool? trends,
    PackageGender? gender,
    this.city,
  })  : type = type == null || type == PackageType.unknown || type == PackageType.all
            ? null
            : type.toString().split('.').last,
        trends = trends == true ? '' : null,
        gender = gender == null || gender == PackageGender.unknown || gender == PackageGender.all
            ? null
            : gender.toString().split('.').last;

  final String? type;
  final String? trends;
  final String? gender;
  final String? city;

  factory PackageFilters.fromJson(Map<String, dynamic> json) => _$PackageFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$PackageFiltersToJson(this);
}
