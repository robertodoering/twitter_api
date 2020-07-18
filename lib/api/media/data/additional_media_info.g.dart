// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'additional_media_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdditionalMediaInfo _$AdditionalMediaInfoFromJson(Map<String, dynamic> json) {
  return AdditionalMediaInfo()
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..embeddable = json['embeddable'] as bool
    ..monetizable = json['monetizable'] as bool;
}

Map<String, dynamic> _$AdditionalMediaInfoToJson(
        AdditionalMediaInfo instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'embeddable': instance.embeddable,
      'monetizable': instance.monetizable,
    };
