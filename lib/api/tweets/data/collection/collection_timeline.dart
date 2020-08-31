import 'package:json_annotation/json_annotation.dart';

part 'collection_timeline.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CollectionTimeline {
  CollectionTimeline({
    this.name,
    this.userId,
    this.collectionUrl,
    this.customTimelineUrl,
    this.description,
    this.url,
    this.visibility,
    this.timelineOrder,
    this.collectionType,
    this.customTimelineType,
  });

  String name;
  String userId;
  String collectionUrl;
  String customTimelineUrl;
  String description;
  String url;
  String visibility;
  String timelineOrder;
  String collectionType;
  String customTimelineType;

  factory CollectionTimeline.fromJson(Map<String, dynamic> json) =>
      CollectionTimeline(
        name: json['name'],
        userId: json['user_id'],
        collectionUrl: json['collection_url'],
        customTimelineUrl: json['custom_timeline_url'],
        description: json['description'],
        url: json['url'],
        visibility: json['visibility'],
        timelineOrder: json['timeline_order'],
        collectionType: json['collection_type'],
        customTimelineType: json['custom_timeline_type'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'user_id': userId,
        'collection_url': collectionUrl,
        'custom_timeline_url': customTimelineUrl,
        'description': description,
        'url': url,
        'visibility': visibility,
        'timeline_order': timelineOrder,
        'collection_type': collectionType,
        'custom_timeline_type': customTimelineType,
      };
}
