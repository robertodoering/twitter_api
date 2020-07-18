import 'package:json_annotation/json_annotation.dart';

part 'additional_media_info.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class AdditionalMediaInfo {
  AdditionalMediaInfo();

  factory AdditionalMediaInfo.fromJson(Map<String, dynamic> json) =>
      _$AdditionalMediaInfoFromJson(json);

  String title;

  String description;

  bool embeddable;

  bool monetizable;

  Map<String, dynamic> toJson() => _$AdditionalMediaInfoToJson(this);
}
