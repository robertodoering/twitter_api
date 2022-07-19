// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Relationship _$RelationshipFromJson(Map<String, dynamic> json) {
  return Relationship()
    ..relationship = json['relationship'] == null
        ? null
        : RelationshipObject.fromJson(
            json['relationship'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RelationshipToJson(Relationship instance) =>
    <String, dynamic>{
      'relationship': instance.relationship?.toJson(),
    };

RelationshipObject _$RelationshipObjectFromJson(Map<String, dynamic> json) {
  return RelationshipObject()
    ..source = json['source'] == null
        ? null
        : RelationshipEntity.fromJson(json['source'] as Map<String, dynamic>)
    ..target = json['target'] == null
        ? null
        : RelationshipEntity.fromJson(json['target'] as Map<String, dynamic>);
}

Map<String, dynamic> _$RelationshipObjectToJson(RelationshipObject instance) =>
    <String, dynamic>{
      'source': instance.source?.toJson(),
      'target': instance.target?.toJson(),
    };
