import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/action.dart';
import 'package:trendys_sdk/models/response/full/wallet.dart';

part 'influencer.g.dart';

@JsonSerializable()
class InfluencerFull {
  final String id;
  final String name;
  @JsonKey(name: 'display_name')
  final String displayName;
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'gender_preferred')
  final String genderPreferred;
  final List<Action> actions;
  final String state;
  final List<Wallet> wallets;
  final String description;
  final int followers;
  final int packages;

  InfluencerFull(
      {this.id,
      this.name,
      this.displayName,
      this.avatarUrl,
      this.actions,
      this.genderPreferred,
      this.state,
      this.wallets,
      this.description,
      this.followers,
      this.packages});

  factory InfluencerFull.fromJson(Map<String, dynamic> json) => _$InfluencerFullFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerFullToJson(this);
}
