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
    ..durationMinutes = json['duration_minutes'] as String;
}

Map<String, dynamic> _$PollToJson(Poll instance) => <String, dynamic>{
      'options': instance.options?.map((e) => e?.toJson())?.toList(),
      'duration_minutes': instance.durationMinutes,
    };
