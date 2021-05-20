import 'package:json_annotation/json_annotation.dart';

enum UserGender {
  unknown,
  women,
  man,
  @JsonValue('not_defined')
  notDefined,
}
