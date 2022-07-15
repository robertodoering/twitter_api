import 'package:json_annotation/json_annotation.dart';

part 'relationship_entity.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
  includeIfNull: false,
)
class RelationshipEntity {
  RelationshipEntity();

  factory RelationshipEntity.fromJson(Map<String, dynamic> json) =>
      _$RelationshipEntityFromJson(json);

  String? idStr;

  String? screenName;

  bool? following;

  bool? followedBy;

  bool? liveFollowing;

  bool? followingReceived;

  bool? followingRequested;

  bool? notificationsEnabled;

  bool? canDm;

  bool? blocking;

  bool? blockedBy;

  bool? wantRetweets;

  bool? allReplies;

  bool? markedSpam;

  Map<String, dynamic> toJson() => _$RelationshipEntityToJson(this);
}
