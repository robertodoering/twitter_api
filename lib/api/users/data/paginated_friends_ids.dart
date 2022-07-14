import 'package:json_annotation/json_annotation.dart';

part 'paginated_friends_ids.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PaginatedFriendsIds {
  PaginatedFriendsIds();

  factory PaginatedFriendsIds.fromJson(Map<String, dynamic> json) =>
      _$PaginatedFriendsIdsFromJson(json);

  List<int>? ids;
  String? previousCursorStr;
  String? nextCursorStr;

  Map<String, dynamic> toJson() => _$PaginatedFriendsIdsToJson(this);
}
