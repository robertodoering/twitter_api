import 'package:dart_twitter_api/api/tweets/data/tweet.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tweet_search.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class TweetSearch {
  TweetSearch();

  factory TweetSearch.fromJson(Map<String, dynamic> json) =>
      _$TweetSearchFromJson(json);

  List<Tweet>? statuses;

  SearchMetadata? searchMetadata;

  Map<String, dynamic> toJson() => _$TweetSearchToJson(this);
}

@JsonSerializable()
class SearchMetadata {
  SearchMetadata();

  factory SearchMetadata.fromJson(Map<String, dynamic> json) =>
      _$SearchMetadataFromJson(json);

  double? completedIn;

  String? maxIdStr;

  String? nextResults;

  String? query;

  String? refreshUrl;

  int? count;

  String? sinceIdStr;

  Map<String, dynamic> toJson() => _$SearchMetadataToJson(this);
}
