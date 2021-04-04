// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'twitter_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TwitterList _$TwitterListFromJson(Map<String, dynamic> json) {
  return TwitterList()
    ..slug = json['slug'] as String?
    ..name = json['name'] as String?
    ..createdAt = convertTwitterDateTime(json['created_at'] as String?)
    ..uri = json['uri'] as String?
    ..subscriberCount = json['subscriber_count'] as int?
    ..idStr = json['id_str'] as String?
    ..memberCount = json['member_count'] as int?
    ..mode = json['mode'] as String?
    ..fullName = json['full_name'] as String?
    ..description = json['description'] as String?
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..following = json['following'] as bool?;
}

Map<String, dynamic> _$TwitterListToJson(TwitterList instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'uri': instance.uri,
      'subscriber_count': instance.subscriberCount,
      'id_str': instance.idStr,
      'member_count': instance.memberCount,
      'mode': instance.mode,
      'full_name': instance.fullName,
      'description': instance.description,
      'user': instance.user?.toJson(),
      'following': instance.following,
    };
