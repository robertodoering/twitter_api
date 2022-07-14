// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_followers_ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedFollowersIds _$PaginatedFollowersIdsFromJson(
    Map<String, dynamic> json) {
  return PaginatedFollowersIds()
    ..ids = (json['ids'] as List<dynamic>?)?.map((e) => e as int).toList()
    ..nextCursorStr = json['next_cursor_str'] as String?
    ..previousCursorStr = json['previous_cursor_str'] as String?;
}

Map<String, dynamic> _$PaginatedFollowersIdsToJson(
        PaginatedFollowersIds instance) =>
    <String, dynamic>{
      'ids': instance.ids,
      'next_cursor_str': instance.nextCursorStr,
      'previous_cursor_str': instance.previousCursorStr,
    };
