// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_twitter_lists.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedTwitterLists _$PaginatedTwitterListsFromJson(
    Map<String, dynamic> json) {
  return PaginatedTwitterLists()
    ..lists = (json['lists'] as List<dynamic>?)
        ?.map((e) => TwitterList.fromJson(e as Map<String, dynamic>))
        .toList()
    ..nextCursorStr = json['next_cursor_str'] as String?
    ..previousCursorStr = json['previous_cursor_str'] as String?;
}

Map<String, dynamic> _$PaginatedTwitterListsToJson(
        PaginatedTwitterLists instance) =>
    <String, dynamic>{
      'lists': instance.lists?.map((e) => e.toJson()).toList(),
      'next_cursor_str': instance.nextCursorStr,
      'previous_cursor_str': instance.previousCursorStr,
    };
