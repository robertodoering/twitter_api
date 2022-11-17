import 'package:json_annotation/json_annotation.dart';

part 'edit_control.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EditControlData {
  EditControlData();

  factory EditControlData.fromJson(Map<String, dynamic> json) =>
      _$EditControlDataFromJson(json);

  InitialInfo? initial;

  EditedInfo? edit;

  Map<String, dynamic> toJson() => _$EditControlDataToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class InitialInfo {
  InitialInfo();

  factory InitialInfo.fromJson(Map<String, dynamic> json) =>
      _$InitialInfoFromJson(json);

  List<String>? editTweetIds;

  String? editableUntilMsecs;

  String? editsRemaining;

  bool? isEditEligible;

  Map<String, dynamic> toJson() => _$InitialInfoToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EditedInfo {
  EditedInfo();

  factory EditedInfo.fromJson(Map<String, dynamic> json) =>
      _$EditedInfoFromJson(json);

  InitialInfo? editControlInitial;

  String? initialTweetId;

  Map<String, dynamic> toJson() => _$EditedInfoToJson(this);
}
