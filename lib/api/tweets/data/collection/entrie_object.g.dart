// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrie_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrieObject _$EntrieObjectFromJson(Map<String, dynamic> json) {
  return EntrieObject(
    tweets: (json['tweets'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Tweet.fromJson(e as Map<String, dynamic>)),
    ),
    users: (json['users'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : User.fromJson(e as Map<String, dynamic>)),
    ),
    timelines: (json['timelines'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CollectionTimeline.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$EntrieObjectToJson(EntrieObject instance) =>
    <String, dynamic>{
      'tweets': instance.tweets?.map((k, e) => MapEntry(k, e?.toJson())),
      'users': instance.users?.map((k, e) => MapEntry(k, e?.toJson())),
      'timelines': instance.timelines?.map((k, e) => MapEntry(k, e?.toJson())),
    };
