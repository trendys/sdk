import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/request/guest.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class SignIn {
  final UserSignIn user;
  final Guest guest;

  SignIn({this.user, this.guest});

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}

@JsonSerializable()
class UserSignIn {
  final String email;
  final String password;

  UserSignIn({this.email, this.password});

  factory UserSignIn.fromJson(Map<String, dynamic> json) => _$UserSignInFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignInToJson(this);
}
