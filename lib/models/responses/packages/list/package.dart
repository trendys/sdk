import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/package_gender.dart';
import 'package:trendys_sdk/enums/package_state.dart';
import 'package:trendys_sdk/enums/package_type.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/categorizing.dart';
import 'package:trendys_sdk/models/responses/influencers/influencer.dart';
import 'package:trendys_sdk/models/responses/packages/package.dart';

part 'package.g.dart';

@JsonSerializable()
class PackagePartial extends Package {
  PackagePartial({
    required String id,
    required PackageType type,
    required int claps,
    required int favorites,
    required this.imageUrls,
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

  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  factory PackagePartial.fromJson(Map<String, dynamic> json) => _$PackagePartialFromJson(json);

  Map<String, dynamic> toJson() => _$PackagePartialToJson(this);
}
