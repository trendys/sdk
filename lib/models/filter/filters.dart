import 'package:json_annotation/json_annotation.dart';

part 'filters.g.dart';

@JsonSerializable()
class Filters {
  final String type;

  Filters({this.type});

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

  Map<String, dynamic> toJson() => _$FiltersToJson(this);
}
