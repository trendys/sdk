// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginateFilters _$PaginateFiltersFromJson(Map<String, dynamic> json) =>
    PaginateFilters(
      page: json['page'] as int? ?? 1,
      limit: json['limit'] as int? ?? Api.kDefaultPageSize,
    );

Map<String, dynamic> _$PaginateFiltersToJson(PaginateFilters instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
