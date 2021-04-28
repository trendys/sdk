import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/request/guest.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class SignIn {
  SignIn({
    required this.user,
    this.guest,
  });

  final UserSignIn user;
  final Guest? guest;

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);

  Map<String, dynamic> toJson() => _$SignInToJson(this);
}

@JsonSerializable()
class UserSignIn {
  UserSignIn({
    required this.email,
    required this.password,
  });

  final String email;
  final String password;

  factory UserSignIn.fromJson(Map<String, dynamic> json) => _$UserSignInFromJson(json);

  Map<String, dynamic> toJson() => _$UserSignInToJson(this);
}
