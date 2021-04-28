import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class Session {
  Session({
    required this.refreshToken,
  });

  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
