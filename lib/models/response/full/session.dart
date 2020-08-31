import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class SessionFull {
  final String id;
  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;
  @JsonKey(name: 'last_activity_at')
  final String lastActivityAt;
  @JsonKey(name: 'expired_at')
  final String expiredAt;
  final List<String> ips;
  @JsonKey(name: 'user_agents')
  final List<String> userAgents;

  SessionFull({this.id, this.accessToken, this.refreshToken, this.lastActivityAt, this.expiredAt, this.ips, this.userAgents});

  factory SessionFull.fromJson(Map<String, dynamic> json) => _$SessionFullFromJson(json);

  Map<String, dynamic> toJson() => _$SessionFullToJson(this);
}
