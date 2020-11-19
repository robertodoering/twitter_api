// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendLocation _$TrendLocationFromJson(Map<String, dynamic> json) {
  return TrendLocation()
    ..name = json['name'] as String
    ..woeid = json['woeid'] as int;
}

Map<String, dynamic> _$TrendLocationToJson(TrendLocation instance) =>
    <String, dynamic>{
      'name': instance.name,
      'woeid': instance.woeid,
    };
