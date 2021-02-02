// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) {
  return Option()
    ..position = json['position'] as int?
    ..text = json['text'] as String?;
}

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
      'position': instance.position,
      'text': instance.text,
    };
