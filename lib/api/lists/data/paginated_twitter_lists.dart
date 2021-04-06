import 'package:dart_twitter_api/twitter_api.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginated_twitter_lists.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PaginatedTwitterLists {
  PaginatedTwitterLists();

  factory PaginatedTwitterLists.fromJson(Map<String, dynamic> json) =>
      _$PaginatedTwitterListsFromJson(json);

  List<TwitterList>? lists;

  String? nextCursorStr;

  String? previousCursorStr;

  Map<String, dynamic> toJson() => _$PaginatedTwitterListsToJson(this);
}
