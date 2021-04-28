import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/sessions/session.dart' as base;

part 'session.g.dart';

@JsonSerializable()
class Session extends base.Session {
  Session({
    required String id,
    required DateTime lastActivityAt,
    required this.expiredAt,
    required this.ips,
    required this.userAgents,
  }) : super(
          id: id,
          lastActivityAt: lastActivityAt,
        );

  @JsonKey(name: 'expired_at')
  final DateTime? expiredAt;
  final List<String> ips;
  @JsonKey(name: 'user_agents')
  final List<String> userAgents;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
