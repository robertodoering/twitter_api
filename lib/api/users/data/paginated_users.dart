import 'package:json_annotation/json_annotation.dart';
import 'package:twitter_api/api/users/data/user.dart';

part 'paginated_users.g.dart';

@JsonSerializable()
class PaginatedUsers {
  PaginatedUsers();

  factory PaginatedUsers.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUsersFromJson(json);

  List<User> users;

  String nextCursorStr;

  String previousCursorStr;

  Map<String, dynamic> toJson() => _$PaginatedUsersToJson(this);
}
