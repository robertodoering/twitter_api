import 'package:json_annotation/json_annotation.dart';

part 'friendship.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Friendship {
  Friendship();

  factory Friendship.fromJson(Map<String, dynamic> json) =>
      _$FriendshipFromJson(json);

  /// The string representation of the unique identifier for this User.
  String? idStr;

  /// The name of the user, as they’ve defined it. Not necessarily a person’s
  /// name. Typically capped at 50 characters, but subject to change.
  String? name;

  /// The screen name, handle, or alias that this user identifies themselves
  /// with. [screen_names] are unique but subject to change. Use [idStr] as a
  /// user identifier whenever possible. Typically a maximum of 15 characters
  /// long, but some historical accounts may exist with longer names.
  String? screenName;

  /// The connections for this relationship for the authenticated user.
  ///
  /// Can be: `following`, `following_requested`, `followed_by`, `none`,
  /// `blocking`, `muting`.
  List<String>? connections;

  Map<String, dynamic> toJson() => _$FriendshipToJson(this);
}
