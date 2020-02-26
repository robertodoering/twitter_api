// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location()
    ..country = json['country'] as String
    ..countryCode = json['country_code'] as String
    ..locality = json['locality'] as String
    ..region = json['region'] as String
    ..subRegion = json['sub_region'] as String
    ..fullName = json['full_name'] as String
    ..geo = json['geo'] == null
        ? null
        : Coordinates.fromJson(json['geo'] as Map<String, dynamic>);
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'country': instance.country,
      'country_code': instance.countryCode,
      'locality': instance.locality,
      'region': instance.region,
      'sub_region': instance.subRegion,
      'full_name': instance.fullName,
      'geo': instance.geo?.toJson(),
    };
