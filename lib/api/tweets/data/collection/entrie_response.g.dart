// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrie_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrieResponse _$EntrieResponseFromJson(Map<String, dynamic> json) {
  return EntrieResponse(
    timeline: (json['timeline'] as List)
        ?.map((e) => e == null
            ? null
            : EntrieTimeline.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timelineId: json['timeline_id'] as String,
    position: json['position'] == null
        ? null
        : EntriePosition.fromJson(json['position'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntrieResponseToJson(EntrieResponse instance) =>
    <String, dynamic>{
      'timeline': instance.timeline?.map((e) => e?.toJson())?.toList(),
      'timeline_id': instance.timelineId,
      'position': instance.position?.toJson(),
    };
