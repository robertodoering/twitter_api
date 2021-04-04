import 'package:dart_twitter_api/src/utils/date_utils.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'twitter_list.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class TwitterList {
  TwitterList();

  factory TwitterList.fromJson(Map<String, dynamic> json) =>
      _$TwitterListFromJson(json);

  String? slug;
  String? name;
  @JsonKey(fromJson: convertTwitterDateTime)
  DateTime? createdAt;
  String? uri;
  int? subscriberCount;
  String? idStr;
  int? memberCount;
  String? mode;
  String? fullName;
  String? description;
  User? user;
  bool? following;

  Map<String, dynamic> toJson() => _$TwitterListToJson(this);
}
