// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_control.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditControlData _$EditControlDataFromJson(Map<String, dynamic> json) {
  return EditControlData()
    ..initial = json['initial'] == null
        ? null
        : InitialEditInfo.fromJson(json['initial'] as Map<String, dynamic>);
}

Map<String, dynamic> _$EditControlDataToJson(EditControlData instance) =>
    <String, dynamic>{
      'initial': instance.initial?.toJson(),
    };

InitialEditInfo _$InitialEditInfoFromJson(Map<String, dynamic> json) {
  return InitialEditInfo()
    ..editTweetIds = (json['editTweetIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList()
    ..editableUntilMsec =
        convertTwitterDateTime(json['editableUntilMsec'] as String?)
    ..editsRemaining = json['editsRemaining'] as int?
    ..isEditEligible = json['isEditEligible'] as bool?;
}

Map<String, dynamic> _$InitialEditInfoToJson(InitialEditInfo instance) =>
    <String, dynamic>{
      'editTweetIds': instance.editTweetIds,
      'editableUntilMsec': instance.editableUntilMsec?.toIso8601String(),
      'editsRemaining': instance.editsRemaining,
      'isEditEligible': instance.isEditEligible,
    };
