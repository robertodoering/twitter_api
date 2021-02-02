// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoInfo _$VideoInfoFromJson(Map<String, dynamic> json) {
  return VideoInfo()
    ..aspectRatio =
        (json['aspect_ratio'] as List<dynamic>?)?.map((e) => e as int).toList()
    ..durationMillis = json['duration_millis'] as int?
    ..variants = (json['variants'] as List<dynamic>?)
        ?.map((e) => Variant.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$VideoInfoToJson(VideoInfo instance) => <String, dynamic>{
      'aspect_ratio': instance.aspectRatio,
      'duration_millis': instance.durationMillis,
      'variants': instance.variants?.map((e) => e.toJson()).toList(),
    };

Variant _$VariantFromJson(Map<String, dynamic> json) {
  return Variant()
    ..bitrate = json['bitrate'] as int?
    ..contentType = json['content_type'] as String?
    ..url = json['url'] as String?;
}

Map<String, dynamic> _$VariantToJson(Variant instance) => <String, dynamic>{
      'bitrate': instance.bitrate,
      'content_type': instance.contentType,
      'url': instance.url,
    };
