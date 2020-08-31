import 'package:json_annotation/json_annotation.dart';

part 'collection_cursor.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CollectionCursors {
  CollectionCursors({
    this.nextCursor,
  });

  String nextCursor;

  factory CollectionCursors.fromJson(Map<String, dynamic> json) =>
      CollectionCursors(
        nextCursor: json['next_cursor'],
      );

  Map<String, dynamic> toJson() => {
        'ext_cursor': nextCursor,
      };
}
