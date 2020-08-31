import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class SessionShort {
  final String id;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'last_activity_at')
  final String lastActivityAt;

  SessionShort({this.id, this.accessToken, this.refreshToken, this.lastActivityAt});

  factory SessionShort.fromJson(Map<String, dynamic> json) => _$SessionShortFromJson(json);

  Map<String, dynamic> toJson() => _$SessionShortToJson(this);
}
