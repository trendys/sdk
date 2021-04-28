import 'package:json_annotation/json_annotation.dart';

abstract class Session {
  Session({
    required this.id,
    required this.lastActivityAt,
  });

  final String id;
  @JsonKey(name: 'last_activity_at')
  final DateTime lastActivityAt;
}
