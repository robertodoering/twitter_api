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
    ..sourceStatusIdStr = json['source_status_id_str'] as String
    ..type = json['type'] as String
    ..url = json['url'] as String;
}

Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
      'display_url': instance.displayUrl,
      'expanded_url': instance.expandedUrl,
      'id_str': instance.idStr,
      'indicies': instance.indicies,
      'media_url': instance.mediaUrl,
      'media_url_https': instance.mediaUrlHttps,
      'source_status_id_str': instance.sourceStatusIdStr,
      'type': instance.type,
      'url': instance.url,
    };
