// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrie_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrieTimeline _$EntrieTimelineFromJson(Map<String, dynamic> json) {
  return EntrieTimeline(
    tweet: json['tweet'] == null
        ? null
        : EntrieTimelineTweet.fromJson(json['tweet'] as Map<String, dynamic>),
    featureContext: json['feature_context'] as String,
  );
}

Map<String, dynamic> _$EntrieTimelineToJson(EntrieTimeline instance) =>
    <String, dynamic>{
      'tweet': instance.tweet?.toJson(),
      'feature_context': instance.featureContext,
    };
