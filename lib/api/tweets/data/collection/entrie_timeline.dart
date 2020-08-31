import 'package:dart_twitter_api/api/tweets/data/collection/entrie_timeline_tweet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entrie_timeline.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EntrieTimeline {
  EntrieTimeline({
    this.tweet,
    this.featureContext,
  });

  EntrieTimelineTweet tweet;
  String featureContext;

  factory EntrieTimeline.fromJson(Map<String, dynamic> json) => EntrieTimeline(
        tweet: EntrieTimelineTweet.fromJson(json['tweet']),
        featureContext: json['feature_context'],
      );

  Map<String, dynamic> toJson() => {
        'tweet': tweet.toJson(),
        'feature_context': featureContext,
      };
}
