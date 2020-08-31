import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable()
class Guest {
  final String id;

  Guest({this.id});

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestToJson(this);
}

@JsonSerializable()
class GuestCreate {
  final Guest guest;

  GuestCreate({this.guest});

  factory GuestCreate.fromJson(Map<String, dynamic> json) => _$GuestCreateFromJson(json);

  Map<String, dynamic> toJson() => _$GuestCreateToJson(this);
}
