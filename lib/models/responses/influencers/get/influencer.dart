import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/influencer_gender.dart';
import 'package:trendys_sdk/enums/influencer_state.dart';
import 'package:trendys_sdk/models/responses/common/action.dart';
import 'package:trendys_sdk/models/responses/common/wallet.dart';
import 'package:trendys_sdk/models/responses/influencers/list/influencer.dart';

part 'influencer.g.dart';

@JsonSerializable()
class Influencer extends InfluencerPartial {
  Influencer({
    required String id,
    required String name,
    required String displayName,
    required String country,
    required List<Action> actions,
    required int followers,
    required int packages,
    required String? avatarUrl,
    required String? description,
    this.genderPreferred,
    this.state,
    this.wallets,
  }) : super(
          id: id,
          name: name,
          displayName: displayName,
          country: country,
          actions: actions,
          avatarUrl: avatarUrl,
          description: description,
          followers: followers,
          packages: packages,
        );

  @JsonKey(unknownEnumValue: InfluencerGender.unknown)
  final InfluencerGender? genderPreferred;
  @JsonKey(unknownEnumValue: InfluencerState.unknown)
  final InfluencerState? state;
  final List<Wallet>? wallets;

  factory Influencer.fromJson(Map<String, dynamic> json) => _$InfluencerFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerToJson(this);
}
