// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditControlData _$EditControlDataFromJson(Map<String, dynamic> json) {
  return EditControlData()
    ..initial = json['initial'] == null
        ? null
        : InitialInfo.fromJson(json['initial'] as Map<String, dynamic>)
    ..edit = json['edit'] == null
        ? null
        : EditedInfo.fromJson(json['edit'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EditControlDataToJson(EditControlData instance) =>
    <String, dynamic>{
      'initial': instance.initial?.toJson(),
      'edit': instance.edit?.toJson(),
    };

InitialInfo _$InitialInfoFromJson(Map<String, dynamic> json) {
  return InitialInfo()
    ..editTweetIds = (json['edit_tweet_ids'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..editableUntilMsecs = json['editable_until_msecs'] as String?
    ..editsRemaining = json['edits_remaining'] as String?
    ..isEditEligible = json['is_edit_eligible'] as bool?;
}

Map<String, dynamic> _$InitialInfoToJson(InitialInfo instance) =>
    <String, dynamic>{
      'edit_tweet_ids': instance.editTweetIds,
      'editable_until_msecs': instance.editableUntilMsecs,
      'edits_remaining': instance.editsRemaining,
      'is_edit_eligible': instance.isEditEligible,
    };

EditedInfo _$EditedInfoFromJson(Map<String, dynamic> json) {
  return EditedInfo()
    ..editControlInitial = json['edit_control_initial'] == null
        ? null
        : InitialInfo.fromJson(
            json['edit_control_initial'] as Map<String, dynamic>)
    ..initialTweetId = json['initial_tweet_id'] as String?;
}

Map<String, dynamic> _$EditedInfoToJson(EditedInfo instance) =>
    <String, dynamic>{
      'edit_control_initial': instance.editControlInitial,
      'initial_tweet_id': instance.initialTweetId,
    };
