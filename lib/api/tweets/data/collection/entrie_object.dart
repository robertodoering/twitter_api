import 'package:dart_twitter_api/api/tweets/data/collection/collection_timeline.dart';
import 'package:dart_twitter_api/api/tweets/data/tweet.dart';
import 'package:dart_twitter_api/api/users/data/user.dart';

import 'package:json_annotation/json_annotation.dart';

part 'entrie_object.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EntrieObject {
  EntrieObject({
    this.tweets,
    this.users,
    this.timelines,
  });

  Map<String, Tweet> tweets;
  Map<String, User> users;
  Map<String, CollectionTimeline> timelines;

  factory EntrieObject.fromJson(Map<String, dynamic> json) => EntrieObject(
        tweets: Map.from(json['tweets'])
            .map((k, v) => MapEntry<String, Tweet>(k, Tweet.fromJson(v))),
        users: Map.from(json['users'])
            .map((k, v) => MapEntry<String, User>(k, User.fromJson(v))),
        timelines: Map.from(json['timelines']).map((k, v) =>
            MapEntry<String, CollectionTimeline>(
                k, CollectionTimeline.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        'tweets': Map.from(tweets)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'users': Map.from(users)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
        'timelines': Map.from(timelines),
      };
}
