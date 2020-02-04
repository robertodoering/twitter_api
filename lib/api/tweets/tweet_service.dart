import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:twitter_api/api/twitter_client.dart';

class TweetService {
  const TweetService({
    @required this.client,
  });

  final TwitterClient client;

  /// Updates the authenticating user's current status, also known as Tweeting.
  ///
  /// [inReplyToStatus] will be ignored if the auther of the tweet is not
  /// mentioned within the status text. Therefore, you must include `@username`,
  /// where username is the author of the referenced Tweet.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-update.
  Future<Tweet> updateStatus({
    @required String status,
    String inReplyToStatus,
    List<String> mediaIds,
  }) {
    final params = <String, String>{
      'tweet_mode': 'extended',
    };

    final body = <String, String>{
      'status': status,
      if (inReplyToStatus != null) 'in_reply_to_status_id': inReplyToStatus,
      if (mediaIds != null) 'media_ids': mediaIds.join(','),
    };

    return client
        .post(
      Uri.https(
        'api.twitter.com/1.1',
        '/statuses/update.json',
        params,
      ),
      body: body,
    )
        .then((response) {
      return Tweet.fromJson((json.decode(response.body)));
    });
  }
}
