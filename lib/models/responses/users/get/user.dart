import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/user_gender.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.id,
    this.email,
    this.name,
    this.displayName,
    this.avatarUrl,
    this.country,
    this.genderInterested,
  });

  final String id;
  final String? email;
  final String? name;
  @JsonKey(name: 'display_name')
  final String? displayName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  final String? country;
  @JsonKey(name: 'gender_interested', unknownEnumValue: UserGender.unknown)
  final UserGender? genderInterested;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
