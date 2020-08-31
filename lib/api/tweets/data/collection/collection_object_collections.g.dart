// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_object_collections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionObjectCollections _$CollectionObjectCollectionsFromJson(
    Map<String, dynamic> json) {
  return CollectionObjectCollections(
    objects: json['objects'] == null
        ? null
        : CollectionObject.fromJson(json['objects'] as Map<String, dynamic>),
    response: json['response'] == null
        ? null
        : CollectionResponse.fromJson(json['response'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionObjectCollectionsToJson(
        CollectionObjectCollections instance) =>
    <String, dynamic>{
      'objects': instance.objects?.toJson(),
      'response': instance.response?.toJson(),
    };
