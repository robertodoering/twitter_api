// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrie_object_collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EntrieObjectCollections _$EntrieObjectCollectionsFromJson(
    Map<String, dynamic> json) {
  return EntrieObjectCollections(
    objects: json['objects'] == null
        ? null
        : EntrieObject.fromJson(json['objects'] as Map<String, dynamic>),
    response: json['response'] == null
        ? null
        : EntrieResponse.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$EntrieObjectCollectionsToJson(
        EntrieObjectCollections instance) =>
    <String, dynamic>{
      'objects': instance.objects?.toJson(),
      'response': instance.response?.toJson(),
    };
