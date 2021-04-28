import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/sessions/sign_in/session.dart';

part 'guest.g.dart';

@JsonSerializable()
class Guest {
  Guest({
    required this.id,
    required this.session,
  });

  final String id;
  final Session session;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
