// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'relationship_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelationshipEntity _$RelationshipEntityFromJson(Map<String, dynamic> json) {
  return RelationshipEntity()
    ..idStr = json['id_str'] as String?
    ..screenName = json['screen_name'] as String?
    ..following = json['following'] as bool?
    ..followedBy = json['followed_by'] as bool?
    ..liveFollowing = json['live_following'] as bool?
    ..followingReceived = json['following_received'] as bool?
    ..followingRequested = json['following_requested'] as bool?
    ..notificationsEnabled = json['notifications_enabled'] as bool?
    ..canDm = json['can_dm'] as bool?
    ..blocking = json['blocking'] as bool?
    ..blockedBy = json['blocked_by'] as bool?
    ..muting = json['muting'] as bool?
    ..wantRetweets = json['want_retweets'] as bool?
    ..allReplies = json['all_replies'] as bool?
    ..markedSpam = json['marked_spam'] as bool?;
}

Map<String, dynamic> _$RelationshipEntityToJson(RelationshipEntity instance) =>
    <String, dynamic>{
      'id_str': instance.idStr,
      'screen_name': instance.screenName,
      'following': instance.following,
      'followed_by': instance.followedBy,
      'live_following': instance.liveFollowing,
      'following_received': instance.followingReceived,
      'following_requested': instance.followingRequested,
      'notifications_enabled': instance.notificationsEnabled,
      'can_dm': instance.canDm,
      'blocking': instance.blocking,
      'blocked_by': instance.blockedBy,
      'muting': instance.muting,
      'want_retweets': instance.wantRetweets,
      'all_replies': instance.allReplies,
      'marked_spam': instance.markedSpam,
    };
