import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/user_gender.dart';
import 'package:trendys_sdk/models/responses/sessions/sign_in/session.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.id,
    required this.email,
    required this.name,
    required this.displayName,
    required this.avatarUrl,
    required this.country,
    required this.genderInterested,
    required this.session,
  });

  final String id;
  final String email;
  final String name;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  final String country;
  @JsonKey(name: 'gender_interested', unknownEnumValue: UserGender.unknown)
  final UserGender genderInterested;
  final Session session;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
