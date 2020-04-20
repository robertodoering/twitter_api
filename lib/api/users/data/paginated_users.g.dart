// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginatedUsers _$PaginatedUsersFromJson(Map<String, dynamic> json) {
  return PaginatedUsers()
    ..users = (json['users'] as List)
        ?.map(
            (e) => e == null ? null : User.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..nextCursorStr = json['nextCursorStr'] as String
    ..previousCursorStr = json['previousCursorStr'] as String;
}

Map<String, dynamic> _$PaginatedUsersToJson(PaginatedUsers instance) =>
    <String, dynamic>{
      'users': instance.users,
      'nextCursorStr': instance.nextCursorStr,
      'previousCursorStr': instance.previousCursorStr,
    };
