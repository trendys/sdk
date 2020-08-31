import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/short/session.dart';

part 'guest.g.dart';

@JsonSerializable()
class Guest {
  final String id;
  final SessionShort session;

  Guest({this.id, this.session});

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestToJson(this);
}
