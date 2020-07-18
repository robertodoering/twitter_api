import 'package:json_annotation/json_annotation.dart';

part 'video_info.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class VideoInfo {
  VideoInfo();

  factory VideoInfo.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoFromJson(json);

  List<int> aspectRatio;

  int durationMillis;

  List<Variant> variants;

  Map<String, dynamic> toJson() => _$VideoInfoToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Variant {
  Variant();

  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  int bitrate;

  String contentType;

  String url;

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}
