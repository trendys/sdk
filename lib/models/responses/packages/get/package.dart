import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/package_gender.dart';
import 'package:trendys_sdk/enums/package_state.dart';
import 'package:trendys_sdk/enums/package_type.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/categorizing.dart';
import 'package:trendys_sdk/models/responses/common/image.dart';
import 'package:trendys_sdk/models/responses/influencers/influencer.dart';
import 'package:trendys_sdk/models/responses/packages/package.dart' as base;

part 'package.g.dart';

@JsonSerializable()
class Package extends base.Package {
  Package({
    required String id,
    required PackageType type,
    required int claps,
    required int favorites,
    required this.images,
    required List<Action> actions,
    required InfluencerPartial influencer,
    required List<Categorizing> categorizings,
    PackageGender? gender,
    String? feedback,
    PackageState? state,
  }) : super(
          id: id,
          type: type,
          claps: claps,
          favorites: favorites,
          actions: actions,
          influencer: influencer,
          categorizings: categorizings,
          gender: gender,
          feedback: feedback,
          state: state,
        );

  final List<Image> images;

  factory Package.fromJson(Map<String, dynamic> json) => _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);
}
