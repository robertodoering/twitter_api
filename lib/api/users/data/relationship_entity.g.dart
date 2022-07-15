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
    ..wantRetweets = json['want_retweets'] as bool?
    ..allReplies = json['all_replies'] as bool?
    ..markedSpam = json['marked_spam'] as bool?;
}

Map<String, dynamic> _$RelationshipEntityToJson(RelationshipEntity instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id_str', instance.idStr);
  writeNotNull('screen_name', instance.screenName);
  writeNotNull('following', instance.following);
  writeNotNull('followed_by', instance.followedBy);
  writeNotNull('live_following', instance.liveFollowing);
  writeNotNull('following_received', instance.followingReceived);
  writeNotNull('following_requested', instance.followingRequested);
  writeNotNull('notifications_enabled', instance.notificationsEnabled);
  writeNotNull('can_dm', instance.canDm);
  writeNotNull('blocking', instance.blocking);
  writeNotNull('blocked_by', instance.blockedBy);
  writeNotNull('want_retweets', instance.wantRetweets);
  writeNotNull('all_replies', instance.allReplies);
  writeNotNull('marked_spam', instance.markedSpam);
  return val;
}
