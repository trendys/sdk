import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/short/session.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String email;
  final String name;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  final String country;
  @JsonKey(name: 'gender_interested')
  final String genderInterested;
  final SessionShort session;

  User({this.id, this.email, this.name, this.displayName, this.avatarUrl, this.country, this.genderInterested, this.session});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
