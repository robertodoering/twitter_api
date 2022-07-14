import 'package:json_annotation/json_annotation.dart';

part 'paginated_followers_ids.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PaginatedFollowersIds {
  PaginatedFollowersIds();

  factory PaginatedFollowersIds.fromJson(Map<String, dynamic> json) =>
      _$PaginatedFollowersIdsFromJson(json);

  List<int>? ids;

  String? nextCursorStr;

  String? previousCursorStr;

  Map<String, dynamic> toJson() => _$PaginatedFollowersIdsToJson(this);
}
