import 'package:json_annotation/json_annotation.dart';

part 'paginated_ids.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PaginatedIds {
  PaginatedIds();

  factory PaginatedIds.fromJson(Map<String, dynamic> json) =>
      _$PaginatedIdsFromJson(json);

  List<int>? ids;
  String? previousCursorStr;
  String? nextCursorStr;

  Map<String, dynamic> toJson() => _$PaginatedIdsToJson(this);
}
