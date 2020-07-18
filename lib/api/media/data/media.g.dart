// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Media _$MediaFromJson(Map<String, dynamic> json) {
  return Media()
    ..displayUrl = json['display_url'] as String
    ..expandedUrl = json['expanded_url'] as String
    ..idStr = json['id_str'] as String
    ..indicies = (json['indicies'] as List)?.map((e) => e as int)?.toList()
    ..mediaUrl = json['media_url'] as String
    ..mediaUrlHttps = json['media_url_https'] as String
    ..sizes = json['sizes'] == null
        ? null
        : Sizes.fromJson(json['sizes'] as Map<String, dynamic>)
    ..sourceStatusIdStr = json['source_status_id_str'] as String
    ..type = json['type'] as String
    ..url = json['url'] as String
    ..videoInfo = json['video_info'] == null
        ? null
        : VideoInfo.fromJson(json['video_info'] as Map<String, dynamic>)
    ..additionalMediaInfo = json['additional_media_info'] == null
        ? null
        : AdditionalMediaInfo.fromJson(
            json['additional_media_info'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'display_url': instance.displayUrl,
      'expanded_url': instance.expandedUrl,
      'id_str': instance.idStr,
      'indicies': instance.indicies,
      'media_url': instance.mediaUrl,
      'media_url_https': instance.mediaUrlHttps,
      'sizes': instance.sizes?.toJson(),
      'source_status_id_str': instance.sourceStatusIdStr,
      'type': instance.type,
      'url': instance.url,
      'video_info': instance.videoInfo?.toJson(),
      'additional_media_info': instance.additionalMediaInfo?.toJson(),
    };
