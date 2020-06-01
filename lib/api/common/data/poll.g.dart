// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poll.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poll _$PollFromJson(Map<String, dynamic> json) {
  return Poll()
    ..options = (json['options'] as List)
        ?.map((e) =>
            e == null ? null : Option.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..endDatetime = convertTwitterDateTime(json['end_datetime'] as String)
    ..durationMinutes = json['duration_minutes'] as String;
}

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'options': instance.options?.map((e) => e?.toJson())?.toList(),
      'end_datetime': instance.endDatetime?.toIso8601String(),
      'duration_minutes': instance.durationMinutes,
    };
