// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) => SignIn(
      user: UserSignIn.fromJson(json['user'] as Map<String, dynamic>),
      guest: json['guest'] == null
          ? null
          : Guest.fromJson(json['guest'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'user': instance.user,
      'guest': instance.guest,
    };

UserSignIn _$UserSignInFromJson(Map<String, dynamic> json) => UserSignIn(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserSignInToJson(UserSignIn instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
