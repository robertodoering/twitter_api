// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrie_position.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntriePosition _$EntriePositionFromJson(Map<String, dynamic> json) {
  return EntriePosition(
    maxPosition: json['max_position'] as String,
    minPosition: json['min_position'] as String,
    wasTruncated: json['was_truncated'] as bool,
  );
}

Map<String, dynamic> _$EntriePositionToJson(EntriePosition instance) =>
    <String, dynamic>{
      'max_position': instance.maxPosition,
      'min_position': instance.minPosition,
      'was_truncated': instance.wasTruncated,
    };
