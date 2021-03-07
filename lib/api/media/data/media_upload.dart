import 'package:json_annotation/json_annotation.dart';

part 'media_upload.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UploadInit {
  UploadInit();

  factory UploadInit.fromJson(Map<String, dynamic> json) =>
      _$UploadInitFromJson(json);

  String? mediaIdString;

  int? size;

  int? expiresAfterSecs;

  Map<String, dynamic> toJson() => _$UploadInitToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UploadStatus {
  UploadStatus();

  String? mediaIdString;

  int? expiresAfterSecs;

  ProcessingInfo? processingInfo;

  factory UploadStatus.fromJson(Map<String, dynamic> json) =>
      _$UploadStatusFromJson(json);

  Map<String, dynamic> toJson() => _$UploadStatusToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class UploadFinalize {
  UploadFinalize();

  String? mediaIdString;

  int? expiresAfterSecs;

  int? size;

  ProcessingInfo? processingInfo;

  factory UploadFinalize.fromJson(Map<String, dynamic> json) =>
      _$UploadFinalizeFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFinalizeToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class ProcessingInfo {
  ProcessingInfo();

  factory ProcessingInfo.fromJson(Map<String, dynamic> json) =>
      _$ProcessingInfoFromJson(json);

  String? state;

  int? progressPercent;

  int? checkAfterSecs;

  bool get pending => state == 'pending';
  bool get inProgress => state == 'in_progress';
  bool get succeeded => state == 'succeeded';
  bool get failed => state == 'failed';

  Map<String, dynamic> toJson() => _$ProcessingInfoToJson(this);
}
