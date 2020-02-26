import 'package:json_annotation/json_annotation.dart';
import 'package:twitter_api/api/common/data/option.dart';

part 'poll.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Poll {
  Poll();

  factory Poll.fromJson(Map<String, dynamic> json) => _$PollFromJson(json);

  /// An array of options, each having a poll position, and the text for that
  /// position.
  List<Option> options;

  /// Time stamp (UTC) of when poll ends.
  // todo
  // @JsonKey(fromJson: convertFromTwitterDateString)
  // DateTime endDatetime;

  /// Duration of poll in minutes.
  String durationMinutes;

  Map<String, dynamic> toJson() => _$PollToJson(this);
}
