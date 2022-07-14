// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_friends_ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedFriendsIds _$PaginatedFriendsIdsFromJson(Map<String, dynamic> json) {
  return PaginatedFriendsIds()
    ..ids = (json['ids'] as List<dynamic>?)?.map((e) => e as int).toList()
    ..previousCursorStr = json['previous_cursor_str'] as String?
    ..nextCursorStr = json['next_cursor_str'] as String?;
}

Map<String, dynamic> _$PaginatedFriendsIdsToJson(
        PaginatedFriendsIds instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'previous_cursor_str': instance.previousCursorStr,
      'next_cursor_str': instance.nextCursorStr,
    };
