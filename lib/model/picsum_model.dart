import 'package:json_annotation/json_annotation.dart';

part 'picsum_model.g.dart';

@JsonSerializable()
class PicSumModel {
  String? id;
  String? author;
  int? width;
  int? height;
  String? url;
  String? download_url;

  PicSumModel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.download_url
  });

  factory PicSumModel.fromJson(Map<String, dynamic> json) => _$PicSumModelFromJson(json);
  Map<String, dynamic> toJson() => _$PicSumModelToJson(this);
}