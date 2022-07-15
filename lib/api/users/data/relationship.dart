import 'package:dart_twitter_api/api/users/data/relationship_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'relationship.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Relationship {
  Relationship();

  factory Relationship.fromJson(Map<String, dynamic> json) =>
      _$RelationshipFromJson(json);

  RelationshipObject? relationship;

  Map<String, dynamic> toJson() => _$RelationshipToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class RelationshipObject {
  RelationshipObject();

  factory RelationshipObject.fromJson(Map<String, dynamic> json) =>
      _$RelationshipObjectFromJson(json);

  RelationshipEntity? source;

  RelationshipEntity? target;

  Map<String, dynamic> toJson() => _$RelationshipObjectToJson(this);
}
