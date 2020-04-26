// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TweetSearch _$TweetSearchFromJson(Map<String, dynamic> json) {
  return TweetSearch()
    ..statuses = (json['statuses'] as List)
        ?.map(
            (e) => e == null ? null : Tweet.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..searchMetadata = json['search_metadata'] == null
        ? null
        : SearchMetadata.fromJson(
            json['search_metadata'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TweetSearchToJson(TweetSearch instance) =>
    <String, dynamic>{
      'statuses': instance.statuses?.map((e) => e?.toJson())?.toList(),
      'search_metadata': instance.searchMetadata?.toJson(),
    };

SearchMetadata _$SearchMetadataFromJson(Map<String, dynamic> json) {
  return SearchMetadata()
    ..completedIn = (json['completedIn'] as num)?.toDouble()
    ..maxIdStr = json['maxIdStr'] as String
    ..nextResults = json['nextResults'] as String
    ..query = json['query'] as String
    ..refreshUrl = json['refreshUrl'] as String
    ..count = json['count'] as int
    ..sinceIdStr = json['sinceIdStr'] as String;
}

Map<String, dynamic> _$SearchMetadataToJson(SearchMetadata instance) =>
    <String, dynamic>{
      'completedIn': instance.completedIn,
      'maxIdStr': instance.maxIdStr,
      'nextResults': instance.nextResults,
      'query': instance.query,
      'refreshUrl': instance.refreshUrl,
      'count': instance.count,
      'sinceIdStr': instance.sinceIdStr,
    };
