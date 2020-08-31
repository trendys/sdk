import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/action.dart';
import 'package:trendys_sdk/models/response/full/categorizing.dart';
import 'package:trendys_sdk/models/response/short/influencer.dart';

part 'package.g.dart';

@JsonSerializable()
class PackageShort {
  final String id;
  final String type;
  final String state;
  final String gender;
  final int claps;
  final int favorites;
  final InfluencerShort influencer;
  final List<Categorizing> categorizings;
  final List<Action> actions;
  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  PackageShort({this.id, this.type, this.state, this.gender, this.claps, this.favorites, this.influencer, this.categorizings, this.actions, this.imageUrls});

  factory PackageShort.fromJson(Map<String, dynamic> json) => _$PackageShortFromJson(json);

  Map<String, dynamic> toJson() => _$PackageShortToJson(this);
}
