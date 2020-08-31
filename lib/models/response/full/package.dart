import 'dart:core';

import 'package:json_annotation/json_annotation.dart';
import 'package:trendys_sdk/models/response/full/action.dart';
import 'package:trendys_sdk/models/response/full/categorizing.dart';
import 'package:trendys_sdk/models/response/full/image.dart';
import 'package:trendys_sdk/models/response/short/influencer.dart';

part 'package.g.dart';

@JsonSerializable()
class PackageFull {
  final String id;
  final String type;
  final String state;
  final String gender;
  final int claps;
  final int favorites;
  final InfluencerShort influencer;
  final List<Categorizing> categorizings;
  final List<Action> actions;
  final List<Image> images;

  PackageFull({this.id, this.type, this.state, this.gender, this.claps, this.favorites, this.influencer, this.categorizings, this.actions, this.images});

  factory PackageFull.fromJson(Map<String, dynamic> json) => _$PackageFullFromJson(json);

  Map<String, dynamic> toJson() => _$PackageFullToJson(this);
}
