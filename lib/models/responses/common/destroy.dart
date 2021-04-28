import 'package:json_annotation/json_annotation.dart';

part 'destroy.g.dart';

@JsonSerializable()
class Destroy {
  Destroy({
    required this.success,
  });

  final bool success;

  factory Destroy.fromJson(Map<String, dynamic> json) => _$DestroyFromJson(json);

  Map<String, dynamic> toJson() => _$DestroyToJson(this);
}
