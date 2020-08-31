import 'package:json_annotation/json_annotation.dart';

part 'collection_result.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CollectionResult {
  CollectionResult({
    this.timelineId,
  });

  String timelineId;

  factory CollectionResult.fromJson(Map<String, dynamic> json) =>
      CollectionResult(
        timelineId: json['timeline_id'],
      );

  Map<String, dynamic> toJson() => {
        'timeline_id': timelineId,
      };
}
