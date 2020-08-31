// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_timeline.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionTimeline _$CollectionTimelineFromJson(Map<String, dynamic> json) {
  return CollectionTimeline(
    name: json['name'] as String,
    userId: json['user_id'] as String,
    collectionUrl: json['collection_url'] as String,
    customTimelineUrl: json['custom_timeline_url'] as String,
    description: json['description'] as String,
    url: json['url'] as String,
    visibility: json['visibility'] as String,
    timelineOrder: json['timeline_order'] as String,
    collectionType: json['collection_type'] as String,
    customTimelineType: json['custom_timeline_type'] as String,
  );
}

Map<String, dynamic> _$CollectionTimelineToJson(CollectionTimeline instance) =>
    <String, dynamic>{
      'name': instance.name,
      'user_id': instance.userId,
      'collection_url': instance.collectionUrl,
      'custom_timeline_url': instance.customTimelineUrl,
      'description': instance.description,
      'url': instance.url,
      'visibility': instance.visibility,
      'timeline_order': instance.timelineOrder,
      'collection_type': instance.collectionType,
      'custom_timeline_type': instance.customTimelineType,
    };
