// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sizes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sizes _$SizesFromJson(Map<String, dynamic> json) {
  return Sizes()
    ..thumb = json['thumb'] == null
        ? null
        : Size.fromJson(json['thumb'] as Map<String, dynamic>)
    ..medium = json['medium'] == null
        ? null
        : Size.fromJson(json['medium'] as Map<String, dynamic>)
    ..small = json['small'] == null
        ? null
        : Size.fromJson(json['small'] as Map<String, dynamic>)
    ..large = json['large'] == null
        ? null
        : Size.fromJson(json['large'] as Map<String, dynamic>);
}

Map<String, dynamic> _$SizesToJson(Sizes instance) => <String, dynamic>{
      'thumb': instance.thumb?.toJson(),
      'medium': instance.medium?.toJson(),
      'small': instance.small?.toJson(),
      'large': instance.large?.toJson(),
    };
