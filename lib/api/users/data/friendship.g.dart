// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friendship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Friendship _$FriendshipFromJson(Map<String, dynamic> json) {
  return Friendship()
    ..idStr = json['id_str'] as String?
    ..name = json['name'] as String?
    ..screenName = json['screen_name'] as String?
    ..connections = (json['connections'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$FriendshipToJson(Friendship instance) =>
    <String, dynamic>{
      'id_str': instance.idStr,
      'name': instance.name,
      'screen_name': instance.screenName,
      'connections': instance.connections,
    };
