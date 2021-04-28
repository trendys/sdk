import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/sessions/session.dart' as base;

part 'session.g.dart';

@JsonSerializable()
class Session extends base.Session {
  Session({
    required String id,
    required DateTime lastActivityAt,
    required this.accessToken,
    required this.refreshToken,
  }) : super(
          id: id,
          lastActivityAt: lastActivityAt,
        );

  @JsonKey(name: 'access_token')
  final String accessToken;
  @JsonKey(name: 'refresh_token')
  final String refreshToken;

  factory Session.fromJson(Map<String, dynamic> json) => _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}
