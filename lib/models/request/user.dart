import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/request/guest.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User({
    required this.email,
    required this.password,
    required this.username,
    required this.displayName,
  });

  final String email;
  final String password;
  final String username;
  @JsonKey(name: 'display_name')
  final String displayName;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserCreate {
  UserCreate({required this.user, required this.guest});

  final User user;
  final Guest guest;

  factory UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateToJson(this);
}
