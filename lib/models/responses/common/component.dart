import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/component_type.dart';

part 'component.g.dart';

@JsonSerializable()
class Component {
  Component({
    required this.id,
    required this.type,
    required this.name,
    required this.iconUrl,
  });

  final String id;
  @JsonKey(unknownEnumValue: ComponentType.unknown)
  final ComponentType type;
  final String? name;
  @JsonKey(name: 'icon_url')
  final String? iconUrl;

  factory Component.fromJson(Map<String, dynamic> json) => _$ComponentFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentToJson(this);
}
