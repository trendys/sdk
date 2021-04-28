import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/enums/influencer_gender.dart';

part 'influencer.g.dart';

@JsonSerializable()
class InfluencerFilters {
  InfluencerFilters({
    InfluencerGender? genderPreferred,
    bool? trends,
  })  : genderPreferred = genderPreferred == null ||
                genderPreferred == InfluencerGender.unknown ||
                genderPreferred == InfluencerGender.all
            ? null
            : genderPreferred.toString().split('.').last,
        trends = trends == true ? '' : null;

  final String? genderPreferred;
  final String? trends;

  factory InfluencerFilters.fromJson(Map<String, dynamic> json) => _$InfluencerFiltersFromJson(json);

  Map<String, dynamic> toJson() => _$InfluencerFiltersToJson(this);
}
