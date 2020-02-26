// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return Place()
    ..id = json['id'] as String
    ..url = json['url'] as String
    ..placeType = json['place_type'] as String
    ..name = json['name'] as String
    ..fullName = json['full_name'] as String
    ..countryCode = json['country_code'] as String
    ..country = json['country'] as String
    ..boundingBox = json['bounding_box'] == null
        ? null
        : BoundingBox.fromJson(json['bounding_box'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PlaceToJson(Place instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'place_type': instance.placeType,
      'name': instance.name,
      'full_name': instance.fullName,
      'country_code': instance.countryCode,
      'country': instance.country,
      'bounding_box': instance.boundingBox?.toJson(),
    };
