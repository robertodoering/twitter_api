import 'package:dart_twitter_api/api/users/data/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_users.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PaginatedUsers {
  PaginatedUsers();

  factory PaginatedUsers.fromJson(Map<String, dynamic> json) =>
      _$PaginatedUsersFromJson(json);

  List<User>? users;

  String? nextCursorStr;

  String? previousCursorStr;

  Map<String, dynamic> toJson() => _$PaginatedUsersToJson(this);
}
