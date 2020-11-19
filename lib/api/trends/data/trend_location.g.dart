// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendLocation _$TrendLocationFromJson(Map<String, dynamic> json) {
  return TrendLocation()
    ..name = json['name'] as String
    ..woeid = json['woeid'] as int
    ..country = json['country'] as String
    ..countryCode = json['countryCode'] as String
    ..parentid = json['parentid'] as int
    ..url = json['url'] as String
    ..placeType = json['placeType'] == null
        ? null
        : PlaceType.fromJson(json['placeType'] as Map<String, dynamic>);
}

Map<String, dynamic> _$TrendLocationToJson(TrendLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'woeid': instance.woeid,
      'country': instance.country,
      'countryCode': instance.countryCode,
      'parentid': instance.parentid,
      'url': instance.url,
      'placeType': instance.placeType?.toJson(),
    };

PlaceType _$PlaceTypeFromJson(Map<String, dynamic> json) {
  return PlaceType()
    ..code = json['code'] as int
    ..name = json['name'] as String;
}

Map<String, dynamic> _$PlaceTypeToJson(PlaceType instance) => <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
    };
