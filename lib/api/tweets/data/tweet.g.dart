// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return Tweet()
    ..createdAt = convertTwitterDateTime(json['created_at'] as String?)
    ..idStr = json['id_str'] as String?
    ..text = json['text'] as String?
    ..source = json['source'] as String?
    ..truncated = json['truncated'] as bool?
    ..inReplyToStatusIdStr = json['in_reply_to_status_id_str'] as String?
    ..inReplyToUserIdStr = json['in_reply_to_user_id_str'] as String?
    ..inReplyToScreenName = json['in_reply_to_screen_name'] as String?
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..coordinates = json['coordinates'] == null
        ? null
        : Coordinates.fromJson(json['coordinates'] as Map<String, dynamic>)
    ..place = json['place'] == null
        ? null
        : Place.fromJson(json['place'] as Map<String, dynamic>)
    ..quotedStatusIdStr = json['quoted_status_id_str'] as String?
    ..isQuoteStatus = json['is_quote_status'] as bool?
    ..quotedStatus = json['quoted_status'] == null
        ? null
        : Tweet.fromJson(json['quoted_status'] as Map<String, dynamic>)
    ..retweetedStatus = json['retweeted_status'] == null
        ? null
        : Tweet.fromJson(json['retweeted_status'] as Map<String, dynamic>)
    ..quoteCount = json['quote_count'] as int?
    ..replyCount = json['reply_count'] as int?
    ..retweetCount = json['retweet_count'] as int?
    ..favoriteCount = json['favorite_count'] as int?
    ..entities = json['entities'] == null
        ? null
        : Entities.fromJson(json['entities'] as Map<String, dynamic>)
    ..extendedEntities = json['extended_entities'] == null
        ? null
        : Entities.fromJson(json['extended_entities'] as Map<String, dynamic>)
    ..favorited = json['favorited'] as bool?
    ..retweeted = json['retweeted'] as bool?
    ..possiblySensitive = json['possibly_sensitive'] as bool?
    ..possiblySensitiveAppealable =
        json['possibly_sensitive_appealable'] as bool?
    ..currentUserRetweet = json['current_user_retweet'] == null
        ? null
        : CurrentUserRetweet.fromJson(
            json['current_user_retweet'] as Map<String, dynamic>)
    ..lang = json['lang'] as String?
    ..quotedStatusPermalink = json['quoted_status_permalink'] == null
        ? null
        : QuotedStatusPermalink.fromJson(
            json['quoted_status_permalink'] as Map<String, dynamic>)
    ..fullText = json['full_text'] as String?
    ..displayTextRange = (json['display_text_range'] as List<dynamic>?)
        ?.map((e) => e as int)
        .toList();
}

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'id_str': instance.idStr,
      'text': instance.text,
      'source': instance.source,
      'truncated': instance.truncated,
      'in_reply_to_status_id_str': instance.inReplyToStatusIdStr,
      'in_reply_to_user_id_str': instance.inReplyToUserIdStr,
      'in_reply_to_screen_name': instance.inReplyToScreenName,
      'user': instance.user?.toJson(),
      'coordinates': instance.coordinates?.toJson(),
      'place': instance.place?.toJson(),
      'quoted_status_id_str': instance.quotedStatusIdStr,
      'is_quote_status': instance.isQuoteStatus,
      'quoted_status': instance.quotedStatus?.toJson(),
      'retweeted_status': instance.retweetedStatus?.toJson(),
      'quote_count': instance.quoteCount,
      'reply_count': instance.replyCount,
      'retweet_count': instance.retweetCount,
      'favorite_count': instance.favoriteCount,
      'entities': instance.entities?.toJson(),
      'extended_entities': instance.extendedEntities?.toJson(),
      'favorited': instance.favorited,
      'retweeted': instance.retweeted,
      'possibly_sensitive': instance.possiblySensitive,
      'possibly_sensitive_appealable': instance.possiblySensitiveAppealable,
      'current_user_retweet': instance.currentUserRetweet?.toJson(),
      'lang': instance.lang,
      'quoted_status_permalink': instance.quotedStatusPermalink?.toJson(),
      'full_text': instance.fullText,
      'display_text_range': instance.displayTextRange,
    };
