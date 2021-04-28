import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/package_gender.dart';
import 'package:trendys_sdk/enums/package_state.dart';
import 'package:trendys_sdk/enums/package_type.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/categorizing.dart';
import 'package:trendys_sdk/models/responses/influencers/influencer.dart';

abstract class Package {
  Package({
    required this.id,
    required this.type,
    required this.claps,
    required this.favorites,
    required this.actions,
    required this.influencer,
    required this.categorizings,
    this.gender,
    this.feedback,
    this.state,
  });

  final String id;
  @JsonKey(unknownEnumValue: PackageType.unknown)
  final PackageType type;
  @JsonKey(unknownEnumValue: PackageState.unknown)
  final PackageState? state;
  final int claps;
  final int favorites;
  @JsonKey(unknownEnumValue: PackageGender.unknown)
  final PackageGender? gender;
  final String? feedback;
  final InfluencerPartial influencer;
  final List<Action> actions;
  final List<Categorizing> categorizings;
}
