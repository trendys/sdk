import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';

part 'influencer.g.dart';

@JsonSerializable()
class InfluencerPartial {
  InfluencerPartial({
    required this.id,
    required this.name,
    required this.displayName,
    required this.country,
    required this.actions,
    required this.avatarUrl,
  });

  final String id;
  final String name;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'avatar_url')
  final String? avatarUrl;
  final String country;
  final List<Action> actions;

  factory InfluencerPartial.fromJson(Map<String, dynamic> json) => _$InfluencerPartialFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerPartialToJson(this);
}
