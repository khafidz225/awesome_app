// To parse this JSON data, do
//
//     final getResPhotosModel = getResPhotosModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'get_res_photos_model.g.dart';

GetResPhotosModel getResPhotosModelFromJson(String str) =>
    GetResPhotosModel.fromJson(json.decode(str));

String getResPhotosModelToJson(GetResPhotosModel data) =>
    json.encode(data.toJson());

@JsonSerializable()
class GetResPhotosModel {
  @JsonKey(name: "page")
  int page;
  @JsonKey(name: "per_page")
  int perPage;
  @JsonKey(name: "photos")
  List<Photo> photos;
  @JsonKey(name: "total_results")
  int totalResults;

  GetResPhotosModel({
    required this.page,
    required this.perPage,
    required this.photos,
    required this.totalResults,
  });

  factory GetResPhotosModel.fromJson(Map<String, dynamic> json) =>
      _$GetResPhotosModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetResPhotosModelToJson(this);
}

@JsonSerializable()
class Photo {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "width")
  int width;
  @JsonKey(name: "height")
  int height;
  @JsonKey(name: "url")
  String url;
  @JsonKey(name: "photographer")
  String photographer;
  @JsonKey(name: "photographer_url")
  String photographerUrl;
  @JsonKey(name: "photographer_id")
  int photographerId;
  @JsonKey(name: "avg_color")
  String avgColor;
  @JsonKey(name: "src")
  Src src;
  @JsonKey(name: "liked")
  bool liked;
  @JsonKey(name: "alt")
  String alt;

  Photo({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.avgColor,
    required this.src,
    required this.liked,
    required this.alt,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);
}

@JsonSerializable()
class Src {
  @JsonKey(name: "original")
  String original;
  @JsonKey(name: "large2x")
  String large2X;
  @JsonKey(name: "large")
  String large;
  @JsonKey(name: "medium")
  String medium;
  @JsonKey(name: "small")
  String small;
  @JsonKey(name: "portrait")
  String portrait;
  @JsonKey(name: "landscape")
  String landscape;
  @JsonKey(name: "tiny")
  String tiny;

  Src({
    required this.original,
    required this.large2X,
    required this.large,
    required this.medium,
    required this.small,
    required this.portrait,
    required this.landscape,
    required this.tiny,
  });

  factory Src.fromJson(Map<String, dynamic> json) => _$SrcFromJson(json);

  Map<String, dynamic> toJson() => _$SrcToJson(this);
}
