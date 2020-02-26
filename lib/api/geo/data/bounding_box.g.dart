// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bounding_box.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BoundingBox _$BoundingBoxFromJson(Map<String, dynamic> json) {
  return BoundingBox()
    ..coordinates = (json['coordinates'] as List)
        ?.map((e) => (e as List)
            ?.map((e) =>
                (e as List)?.map((e) => (e as num)?.toDouble())?.toList())
            ?.toList())
        ?.toList()
    ..type = json['type'] as String;
}

Map<String, dynamic> _$BoundingBoxToJson(BoundingBox instance) =>
    <String, dynamic>{
      'coordinates': instance.coordinates,
      'type': instance.type,
    };
