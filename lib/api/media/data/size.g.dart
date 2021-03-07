// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'size.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Size _$SizeFromJson(Map<String, dynamic> json) {
  return Size()
    ..w = json['w'] as int?
    ..h = json['h'] as int?
    ..resize = json['resize'] as String?;
}

Map<String, dynamic> _$SizeToJson(Size instance) => <String, dynamic>{
      'w': instance.w,
      'h': instance.h,
      'resize': instance.resize,
    };
