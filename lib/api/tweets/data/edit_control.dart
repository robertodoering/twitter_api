import 'package:dart_twitter_api/src/utils/date_utils.dart';
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

  InitialEditInfo? initial;

  Map<String, dynamic> toJson() => _$EditControlDataToJson(this);
}

@JsonSerializable()
class InitialEditInfo {
  InitialEditInfo();

  factory InitialEditInfo.fromJson(Map<String, dynamic> json) =>
      _$InitialEditInfoFromJson(json);

  List<String>? editTweetIds;

  @JsonKey(fromJson: convertTwitterDateTime)
  DateTime? editableUntilMsec;

  int? editsRemaining;

  bool? isEditEligible;

  Map<String, dynamic> toJson() => _$InitialEditInfoToJson(this);
}
