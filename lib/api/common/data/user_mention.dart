import 'package:json_annotation/json_annotation.dart';

part 'user_mention.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UserMention {
  UserMention();

  factory UserMention.fromJson(Map<String, dynamic> json) =>
      _$UserMentionFromJson(json);

  /// ID of the mentioned user, as a string.
  String idStr;

  /// An array of integers representing the offsets within the Tweet text where
  /// the user reference begins and ends. The first integer represents the
  /// location of the `@` character of the user mention. The second integer
  /// represents the location of the first non-screenname character following
  /// the user mention.
  List<int> indices;

  /// Display name of the referenced user.
  String name;

  /// Screen name of the referenced user.
  String screenName;

  Map<String, dynamic> toJson() => _$UserMentionToJson(this);
}
