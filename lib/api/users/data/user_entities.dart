import 'package:dart_twitter_api/api/common/data/url.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_entities.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UserEntities {
  UserEntities();

  UserEntityUrl? url;

  UserEntityUrl? description;

  factory UserEntities.fromJson(Map<String, dynamic> json) =>
      _$UserEntitiesFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntitiesToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UserEntityUrl {
  UserEntityUrl();

  List<Url>? urls;

  factory UserEntityUrl.fromJson(Map<String, dynamic> json) =>
      _$UserEntityUrlFromJson(json);

  Map<String, dynamic> toJson() => _$UserEntityUrlToJson(this);
}
