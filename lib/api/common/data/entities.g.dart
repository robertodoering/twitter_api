// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entities.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entities _$EntitiesFromJson(Map<String, dynamic> json) {
  return Entities()
    ..hashtags = (json['hashtags'] as List<dynamic>?)
        ?.map((e) => Hashtag.fromJson(e as Map<String, dynamic>))
        .toList()
    ..media = (json['media'] as List<dynamic>?)
        ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
        .toList()
    ..urls = (json['urls'] as List<dynamic>?)
        ?.map((e) => Url.fromJson(e as Map<String, dynamic>))
        .toList()
    ..userMentions = (json['user_mentions'] as List<dynamic>?)
        ?.map((e) => UserMention.fromJson(e as Map<String, dynamic>))
        .toList()
    ..symbols = (json['symbols'] as List<dynamic>?)
        ?.map((e) => Symbol.fromJson(e as Map<String, dynamic>))
        .toList()
    ..polls = (json['polls'] as List<dynamic>?)
        ?.map((e) => Poll.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$EntitiesToJson(Entities instance) => <String, dynamic>{
      'hashtags': instance.hashtags?.map((e) => e.toJson()).toList(),
      'media': instance.media?.map((e) => e.toJson()).toList(),
      'urls': instance.urls?.map((e) => e.toJson()).toList(),
      'user_mentions': instance.userMentions?.map((e) => e.toJson()).toList(),
      'symbols': instance.symbols?.map((e) => e.toJson()).toList(),
      'polls': instance.polls?.map((e) => e.toJson()).toList(),
    };
