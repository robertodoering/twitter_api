// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_upload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadInit _$UploadInitFromJson(Map<String, dynamic> json) {
  return UploadInit()
    ..mediaIdString = json['media_id_string'] as String
    ..size = json['size'] as int
    ..expiresAfterSecs = json['expires_after_secs'] as int;
}

Map<String, dynamic> _$UploadInitToJson(UploadInit instance) =>
    <String, dynamic>{
      'media_id_string': instance.mediaIdString,
      'size': instance.size,
      'expires_after_secs': instance.expiresAfterSecs,
    };

UploadStatus _$UploadStatusFromJson(Map<String, dynamic> json) {
  return UploadStatus()
    ..mediaIdString = json['media_id_string'] as String
    ..expiresAfterSecs = json['expires_after_secs'] as int
    ..processingInfo = json['processing_info'] == null
        ? null
        : ProcessingInfo.fromJson(
            json['processing_info'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UploadStatusToJson(UploadStatus instance) =>
    <String, dynamic>{
      'media_id_string': instance.mediaIdString,
      'expires_after_secs': instance.expiresAfterSecs,
      'processing_info': instance.processingInfo?.toJson(),
    };

UploadFinalize _$UploadFinalizeFromJson(Map<String, dynamic> json) {
  return UploadFinalize()
    ..mediaIdString = json['media_id_string'] as String
    ..expiresAfterSecs = json['expires_after_secs'] as int
    ..size = json['size'] as int
    ..processingInfo = json['processing_info'] == null
        ? null
        : ProcessingInfo.fromJson(
            json['processing_info'] as Map<String, dynamic>);
}

Map<String, dynamic> _$UploadFinalizeToJson(UploadFinalize instance) =>
    <String, dynamic>{
      'media_id_string': instance.mediaIdString,
      'expires_after_secs': instance.expiresAfterSecs,
      'size': instance.size,
      'processing_info': instance.processingInfo?.toJson(),
    };

ProcessingInfo _$ProcessingInfoFromJson(Map<String, dynamic> json) {
  return ProcessingInfo()
    ..state = json['state'] as String
    ..progressPercent = json['progress_percent'] as int
    ..checkAfterSecs = json['check_after_secs'] as int;
}

Map<String, dynamic> _$ProcessingInfoToJson(ProcessingInfo instance) =>
    <String, dynamic>{
      'state': instance.state,
      'progress_percent': instance.progressPercent,
      'check_after_secs': instance.checkAfterSecs,
    };
