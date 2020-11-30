import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:dart_twitter_api/api/tweets/data/tweet.dart';
import 'package:dart_twitter_api/api/twitter_client.dart';
import 'package:dart_twitter_api/src/utils/map_utils.dart';
import 'package:dart_twitter_api/src/utils/transforms.dart';
import 'package:meta/meta.dart';

class TimelineService {
  const TimelineService({
    @required this.client,
  });

  final AbstractTwitterClient client;

  /// Returns a collection of the most recent Tweets and Retweets posted by the
  /// authenticating user and the users they follow. The home timeline is
  /// central to how most users interact with the Twitter service.
  ///
  /// Up to 800 Tweets are obtainable on the home timeline. It is more volatile
  /// for users that follow many users or follow users who Tweet frequently.
  ///
  /// [count]: Specifies the number of records to retrieve. Must be less than or
  /// equal to 200. Defaults to 20. The value of count is best thought of as a
  /// limit to the number of tweets to return because suspended or deleted
  /// content is removed after the count has been applied.
  ///
  /// [sinceId]: Returns results with an ID greater than (that is, more recent
  /// than) the specified ID. There are limits to the number of Tweets which can
  /// be accessed through the API. If the limit of Tweets has occurred since the
  /// [sinceId], the [sinceId] will be forced to the oldest ID available.
  ///
  /// [maxId]: Returns results with an ID less than (that is, older than) or
  /// equal to the specified ID.
  ///
  /// [trimUser]: When `true`, each Tweet returned in a timeline will include a
  /// user object including only the status authors numerical ID. Omit this
  /// parameter to receive the complete user object.
  ///
  /// [excludeReplies]: This parameter will prevent replies from appearing in
  /// the returned timeline. Using [excludeReplies] with the [count] parameter
  /// will mean you will receive up-to `count` Tweets — this is because the
  /// `count` parameter retrieves that many Tweets before filtering out retweets
  /// and replies.
  ///
  /// [includeEntities]: The `entities` node will not be included when set to
  /// `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-home_timeline.
  Future<List<Tweet>> homeTimeline({
    int count,
    String sinceId,
    String maxId,
    bool trimUser,
    bool excludeReplies,
    bool includeEntities,
    String tweetMode = 'extended',
    TransformResponse<List<Tweet>> transform = defaultTweetListTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('count', count)
      ..addParameter('since_id', sinceId)
      ..addParameter('max_id', maxId)
      ..addParameter('trim_user', trimUser)
      ..addParameter('exclude_replies', excludeReplies)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('tweet_mode', 'extended');

    return client
        .get(Uri.https(
          'api.twitter.com',
          '1.1/statuses/home_timeline.json',
          params,
        ))
        .then(transform);
  }

  /// Returns a collection of the most recent Tweets posted by the user
  /// indicated by the [screenName] or [userId] parameters.
  ///
  /// User timelines belonging to protected users may only be requested when the
  /// authenticated user either "owns" the timeline or is an approved follower
  /// of the owner.
  ///
  /// This method can only return up to 3,200 of a user's most recent Tweets.
  /// Native retweets of other statuses by the user is included in this total,
  /// regardless of whether [includeRts] is set to `false` when requesting this
  /// resource.
  ///
  /// [userId]: The ID of the user for whom to return results.
  ///
  /// [screenName]: The screen name of the user for whom to return results.
  ///
  /// [count]: Specifies the number of Tweets to try and retrieve, up to a
  /// maximum of 200 per distinct request. The value of count is best thought of
  /// as a limit to the number of Tweets to return because suspended or deleted
  /// content is removed after the count has been applied. We include retweets
  /// in the count, even if [includeRts] is not supplied. It is recommended you
  /// always set [includeRts] to `true` when using this API method.
  ///
  /// [sinceId]: Returns results with an ID greater than (that is, more recent
  /// than) the specified ID. There are limits to the number of Tweets which can
  /// be accessed through the API. If the limit of Tweets has occurred since the
  /// [sinceId], the [sinceId] will be forced to the oldest ID available.
  ///
  /// [maxId]: Returns results with an ID less than (that is, older than) or
  /// equal to the specified ID.
  ///
  /// [trimUser]: When `true`, each Tweet returned in a timeline will include a
  /// user object including only the status authors numerical ID. Omit this
  /// parameter to receive the complete user object.
  ///
  /// [excludeReplies]: This parameter will prevent replies from appearing in
  /// the returned timeline. Using [excludeReplies] with the [count] parameter
  /// will mean you will receive up-to `count` Tweets — this is because the
  /// `count` parameter retrieves that many Tweets before filtering out retweets
  /// and replies.
  ///
  /// [includeRts]: When set to `false`, the timeline will strip any native
  /// retweets (though they will still count toward both the maximal length of
  /// the timeline and the slice selected by the count parameter). Note: If
  /// you're using the [trimUser] parameter in conjunction with [includeRts],
  /// the retweets will still contain a full user object.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-user_timeline.
  Future<List<Tweet>> userTimeline({
    String userId,
    String screenName,
    int count,
    String sinceId,
    String maxId,
    bool trimUser,
    bool excludeReplies,
    bool includeRts,
    String tweetMode = 'extended',
    TransformResponse<List<Tweet>> transform = defaultTweetListTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('count', count)
      ..addParameter('since_id', sinceId)
      ..addParameter('max_id', maxId)
      ..addParameter('trim_user', trimUser)
      ..addParameter('exclude_replies', excludeReplies)
      ..addParameter('include_rts', includeRts)
      ..addParameter('tweet_mode', 'extended');

    return client
        .get(Uri.https(
          'api.twitter.com',
          '1.1/statuses/user_timeline.json',
          params,
        ))
        .then(transform);
  }

  /// Returns the 20 most recent mentions (Tweets containing a users'
  /// @screen_name) for the authenticating user.
  ///
  /// This method can only return up to 800 tweets.
  ///
  /// [count]: Specifies the number of Tweets to try and retrieve, up to a
  /// maximum of 200 per distinct request. The value of count is best thought of
  /// as a limit to the number of Tweets to return because suspended or deleted
  /// content is removed after the count has been applied. We include retweets
  /// in the count, even if [includeRts] is not supplied. It is recommended you
  /// always set [includeRts] to `true` when using this API method.
  ///
  /// [sinceId]: Returns results with an ID greater than (that is, more recent
  /// than) the specified ID. There are limits to the number of Tweets which can
  /// be accessed through the API. If the limit of Tweets has occurred since the
  /// [sinceId], the [sinceId] will be forced to the oldest ID available.
  ///
  /// [maxId]: Returns results with an ID less than (that is, older than) or
  /// equal to the specified ID.
  ///
  /// [trimUser]: When `true`, each Tweet returned in a timeline will include a
  /// user object including only the status authors numerical ID. Omit this
  /// parameter to receive the complete user object.
  ///
  /// [includeEntities]: The `entities` node will not be included when set to
  /// `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/timelines/api-reference/get-statuses-mentions_timeline.
  Future<List<Tweet>> mentionsTimeline({
    int count,
    String sinceId,
    String maxId,
    bool trimUser,
    bool includeEntities,
    String tweetMode = 'extended',
    TransformResponse<List<Tweet>> transform = defaultTweetListTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('count', count)
      ..addParameter('since_id', sinceId)
      ..addParameter('max_id', maxId)
      ..addParameter('trim_user', trimUser)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('tweet_mode', 'extended');

    return client
        .get(Uri.https(
          'api.twitter.com',
          '1.1/statuses/mentions_timeline.json',
          params,
        ))
        .then(transform);
  }
}
