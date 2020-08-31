import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/request/guest.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String email;
  final String password;
  final String username;
  @JsonKey(name: 'display_name')
  final String displayName;

  User({this.email, this.password, this.username, this.displayName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserCreate {
  final User user;
  final Guest guest;

  UserCreate({this.user, this.guest});

  factory UserCreate.fromJson(Map<String, dynamic> json) => _$UserCreateFromJson(json);

  Map<String, dynamic> toJson() => _$UserCreateToJson(this);
}
