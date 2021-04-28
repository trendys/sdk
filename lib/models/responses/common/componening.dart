import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/component.dart';

part 'componening.g.dart';

@JsonSerializable()
class Componening {
  Componening({
    required this.component,
  });

  final Component component;

  factory Componening.fromJson(Map<String, dynamic> json) => _$ComponeningFromJson(json);

  Map<String, dynamic> toJson() => _$ComponeningToJson(this);
}
