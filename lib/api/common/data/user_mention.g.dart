// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_mention.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserMention _$UserMentionFromJson(Map<String, dynamic> json) {
  return UserMention()
    ..idStr = json['id_str'] as String
    ..indices = (json['indices'] as List)?.map((e) => e as int)?.toList()
    ..name = json['name'] as String
    ..screenName = json['screen_name'] as String;
}

Map<String, dynamic> _$UserMentionToJson(UserMention instance) =>
    <String, dynamic>{
      'id_str': instance.idStr,
      'indices': instance.indices,
      'name': instance.name,
      'screen_name': instance.screenName,
    };
