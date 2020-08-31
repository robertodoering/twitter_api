import 'package:dart_twitter_api/api/users/data/user.dart';
import 'package:json_annotation/json_annotation.dart';

import 'collection_timeline.dart';

part 'collection_object.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CollectionObject {
  CollectionObject({
    this.users,
    this.timelines,
  });

  Map<String, User> users;
  Map<String, CollectionTimeline> timelines;

  factory CollectionObject.fromJson(Map<String, dynamic> json) =>
      CollectionObject(
        users: Map.from(json['users'])
            .map((k, v) => MapEntry<String, User>(k, User.fromJson(v))),
        timelines: Map.from(json['timelines']).map((k, v) =>
            MapEntry<String, CollectionTimeline>(
                k, CollectionTimeline.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        'users': Map.from(users)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'timelines': Map.from(timelines)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}
