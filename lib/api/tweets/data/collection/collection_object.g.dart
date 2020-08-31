// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionObject _$CollectionObjectFromJson(Map<String, dynamic> json) {
  return CollectionObject(
    users: (json['users'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : User.fromJson(e as Map<String, dynamic>)),
    ),
    timelines: (json['timelines'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : CollectionTimeline.fromJson(e as Map<String, dynamic>)),
    ),
  );
}

Map<String, dynamic> _$CollectionObjectToJson(CollectionObject instance) =>
    <String, dynamic>{
      'users': instance.users?.map((k, e) => MapEntry(k, e?.toJson())),
      'timelines': instance.timelines?.map((k, e) => MapEntry(k, e?.toJson())),
    };
