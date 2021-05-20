import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/influencers/influencer.dart' as base;

part 'influencer.g.dart';

@JsonSerializable()
class InfluencerPartial extends base.InfluencerPartial {
  InfluencerPartial({
    required String id,
    required String name,
    required String displayName,
    required String country,
    required this.followers,
    required this.packages,
    required List<Action> actions,
    required String? avatarUrl,
    required this.description,
  }) : super(
          id: id,
          name: name,
          displayName: displayName,
          country: country,
          actions: actions,
          avatarUrl: avatarUrl,
        );

  final String? description;
  final int followers;
  final int packages;

  factory InfluencerPartial.fromJson(Map<String, dynamic> json) => _$InfluencerPartialFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerPartialToJson(this);
}
