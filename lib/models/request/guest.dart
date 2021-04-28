import 'package:json_annotation/json_annotation.dart';

part 'guest.g.dart';

@JsonSerializable()
class Guest {
  Guest({
    required this.id,
  });

  final String id;

  factory Guest.fromJson(Map<String, dynamic> json) => _$GuestFromJson(json);

  Map<String, dynamic> toJson() => _$GuestToJson(this);
}

@JsonSerializable()
class GuestCreate {
  GuestCreate({
    required this.guest,
  });

  final Guest guest;

  factory GuestCreate.fromJson(Map<String, dynamic> json) => _$GuestCreateFromJson(json);

  Map<String, dynamic> toJson() => _$GuestCreateToJson(this);
}
