import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/action.dart';
import 'package:trendys_sdk/models/response/full/wallet.dart';

part 'influencer.g.dart';

@JsonSerializable()
class InfluencerShort {
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

  InfluencerShort({this.id, this.name, this.displayName, this.avatarUrl, this.actions, this.genderPreferred, this.state, this.wallets});

  factory InfluencerShort.fromJson(Map<String, dynamic> json) => _$InfluencerShortFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerShortToJson(this);
}
