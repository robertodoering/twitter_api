// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tweet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tweet _$TweetFromJson(Map<String, dynamic> json) {
  return Tweet()
    ..idStr = json['id_str'] as String
    ..text = json['text'] as String
    ..source = json['source'] as String
    ..truncated = json['truncated'] as bool
    ..inReplyToStatusIdStr = json['in_reply_to_status_id_str'] as String
    ..inReplyToUserIdStr = json['in_reply_to_user_id_str'] as String
    ..inReplyToScreenName = json['in_reply_to_screen_name'] as String
    ..user = json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>)
    ..quotedStatusIdStr = json['quoted_status_id_str'] as String
    ..isQuoteStatus = json['is_quote_status'] as bool
    ..quotedStatus = json['quoted_status'] == null
        ? null
        : Tweet.fromJson(json['quoted_status'] as Map<String, dynamic>)
    ..retweetedStatus = json['retweeted_status'] == null
        ? null
        : Tweet.fromJson(json['retweeted_status'] as Map<String, dynamic>)
    ..quoteCount = json['quote_count'] as int
    ..replyCount = json['reply_count'] as int
    ..retweetCount = json['retweet_count'] as int
    ..favoriteCount = json['favorite_count'] as int
    ..favorited = json['favorited'] as bool
    ..retweeted = json['retweeted'] as bool
    ..possiblySensitive = json['possibly_sensitive'] as bool
    ..lang = json['lang'] as String
    ..fullText = json['full_text'] as String
    ..displayTextRange =
        (json['display_text_range'] as List)?.map((e) => e as int)?.toList();
}

Map<String, dynamic> _$TweetToJson(Tweet instance) => <String, dynamic>{
      'id_str': instance.idStr,
      'text': instance.text,
      'source': instance.source,
      'truncated': instance.truncated,
      'in_reply_to_status_id_str': instance.inReplyToStatusIdStr,
      'in_reply_to_user_id_str': instance.inReplyToUserIdStr,
      'in_reply_to_screen_name': instance.inReplyToScreenName,
      'user': instance.user?.toJson(),
      'quoted_status_id_str': instance.quotedStatusIdStr,
      'is_quote_status': instance.isQuoteStatus,
      'quoted_status': instance.quotedStatus?.toJson(),
      'retweeted_status': instance.retweetedStatus?.toJson(),
      'quote_count': instance.quoteCount,
      'reply_count': instance.replyCount,
      'retweet_count': instance.retweetCount,
      'favorite_count': instance.favoriteCount,
      'favorited': instance.favorited,
      'retweeted': instance.retweeted,
      'possibly_sensitive': instance.possiblySensitive,
      'lang': instance.lang,
      'full_text': instance.fullText,
      'display_text_range': instance.displayTextRange,
    };
