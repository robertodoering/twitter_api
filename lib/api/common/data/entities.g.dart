// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entities _$EntitiesFromJson(Map<String, dynamic> json) {
  return Entities()
    ..hashtags = (json['hashtags'] as List)
        ?.map((e) =>
            e == null ? null : Hashtag.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..userMentions = (json['user_mentions'] as List)
        ?.map((e) =>
            e == null ? null : UserMention.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..symbols = (json['symbols'] as List)
        ?.map((e) =>
            e == null ? null : Symbol.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$EntitiesToJson(Entities instance) => <String, dynamic>{
      'hashtags': instance.hashtags?.map((e) => e?.toJson())?.toList(),
      'user_mentions': instance.userMentions?.map((e) => e?.toJson())?.toList(),
      'symbols': instance.symbols?.map((e) => e?.toJson())?.toList(),
    };
