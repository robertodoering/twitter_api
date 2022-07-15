// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_ids.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedIds _$PaginatedIdsFromJson(Map<String, dynamic> json) {
  return PaginatedIds()
    ..ids = (json['ids'] as List<dynamic>?)?.map((e) => e as int).toList()
    ..previousCursorStr = json['previous_cursor_str'] as String?
    ..nextCursorStr = json['next_cursor_str'] as String?;
}

Map<String, dynamic> _$PaginatedIdsToJson(PaginatedIds instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ids', instance.ids);
  writeNotNull('previous_cursor_str', instance.previousCursorStr);
  writeNotNull('next_cursor_str', instance.nextCursorStr);
  return val;
}
