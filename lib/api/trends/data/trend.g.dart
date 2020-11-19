// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trend _$TrendFromJson(Map<String, dynamic> json) {
  return Trend()
    ..name = json['name'] as String
    ..url = json['url'] as String
    ..promotedContent = json['promoted_content']
    ..query = json['query'] as String
    ..tweetVolume = json['tweet_volume'] as int;
}

Map<String, dynamic> _$TrendToJson(Trend instance) => <String, dynamic>{
      'name': instance.name,
      'url': instance.url,
      'promoted_content': instance.promotedContent,
      'query': instance.query,
      'tweet_volume': instance.tweetVolume,
    };
