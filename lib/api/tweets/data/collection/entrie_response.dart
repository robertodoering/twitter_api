import 'package:dart_twitter_api/api/tweets/data/collection/entrie_position.dart';
import 'package:dart_twitter_api/api/tweets/data/collection/entrie_timeline.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entrie_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EntrieResponse {
  EntrieResponse({
    this.timeline,
    this.timelineId,
    this.position,
  });

  List<EntrieTimeline> timeline;
  String timelineId;
  EntriePosition position;

  factory EntrieResponse.fromJson(Map<String, dynamic> json) => EntrieResponse(
        timeline: List<EntrieTimeline>.from(
            json['timeline'].map((x) => EntrieTimeline.fromJson(x))),
        timelineId: json['timeline_id'],
        position: EntriePosition.fromJson(json['position']),
      );

  Map<String, dynamic> toJson() => {
        'timeline': List<dynamic>.from(timeline.map((x) => x.toJson())),
        'timeline_id': timelineId,
        'position': position.toJson(),
      };
}
