// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    email: json['email'] as String,
    password: json['password'] as String,
    username: json['username'] as String,
    displayName: json['display_name'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'username': instance.username,
      'display_name': instance.displayName,
    };

UserCreate _$UserCreateFromJson(Map<String, dynamic> json) {
  return UserCreate(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    guest: Guest.fromJson(json['guest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserCreateToJson(UserCreate instance) =>
    <String, dynamic>{
      'user': instance.user,
      'guest': instance.guest,
    };
