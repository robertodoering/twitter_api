// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'derived.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Derived _$DerivedFromJson(Map<String, dynamic> json) {
  return Derived()
    ..locations = (json['locations'] as List<dynamic>?)
        ?.map((e) => Location.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$DerivedToJson(Derived instance) => <String, dynamic>{
      'locations': instance.locations?.map((e) => e.toJson()).toList(),
    };
