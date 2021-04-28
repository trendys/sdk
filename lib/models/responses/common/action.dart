import 'package:json_annotation/json_annotation.dart';

part 'action.g.dart';

@JsonSerializable()
class Action {
  Action({
    required this.id,
    required this.type,
  });

  final String id;
  final String type;

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);

  Map<String, dynamic> toJson() => _$ActionToJson(this);
}
