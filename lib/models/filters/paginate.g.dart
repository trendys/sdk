// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginateFilters _$PaginateFiltersFromJson(Map<String, dynamic> json) {
  return PaginateFilters(
    page: json['page'] as int,
    limit: json['limit'] as int?,
  );
}

Map<String, dynamic> _$PaginateFiltersToJson(PaginateFilters instance) =>
    <String, dynamic>{
      'page': instance.page,
      'limit': instance.limit,
    };
