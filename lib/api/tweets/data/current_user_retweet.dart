import 'package:json_annotation/json_annotation.dart';

part 'current_user_retweet.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CurrentUserRetweet {
  CurrentUserRetweet();

  factory CurrentUserRetweet.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserRetweetFromJson(json);

  String? idStr;

  Map<String, dynamic> toJson() => _$CurrentUserRetweetToJson(this);
}
