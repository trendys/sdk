import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/config/api.dart';

part 'paginate.g.dart';

@JsonSerializable()
class PaginateFilters {
  const PaginateFilters({
    this.page = 1,
    this.limit = Api.kDefaultPageSize,
  });

  final int page;
  final int? limit;

  factory PaginateFilters.fromJson(Map<String, dynamic> json) => _$PaginateFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$PaginateFiltersToJson(this);
}
