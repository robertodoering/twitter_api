import 'dart:convert';

import 'package:http/http.dart';
import 'package:meta/meta.dart';
import 'package:twitter_api/api/geo/data/place.dart';
import 'package:twitter_api/api/twitter_client.dart';
import 'package:twitter_api/src/annotations.dart';
import 'package:twitter_api/src/utils/map_utils.dart';

import 'data/tweet.dart';

class TweetService {
  const TweetService({
    @required this.client,
  });

  final TwitterClient client;

  /// Updates the authenticating user's current status, also known as Tweeting.
  ///
  /// For each update attempt, the update text is compared with the
  /// authenticating user's recent Tweets. Any attempt that would result in
  /// duplication will be blocked, resulting in a `403` error. A user cannot
  /// submit the same status twice in a row.
  ///
  /// [inReplyToStatusId]: The ID of an existing status that the update is in
  /// reply to. Note: This parameter will be ignored unless the author of the
  /// Tweet this parameter references is mentioned within the status text.
  /// Therefore, you must include `@username`, where username is the author of
  /// the referenced Tweet, within the update.
  ///
  /// [autoPopulateReplyMetadata]: If set to true and used with
  /// [inReplyToStatusId], leading @mentions will be looked up from the original
  /// Tweet, and added to the new Tweet from there. This wil append @mentions
  /// into the metadata of an extended Tweet as a reply chain grows, until the
  /// limit on @mentions is reached. In cases where the original Tweet has been
  /// deleted, the reply will fail.
  ///
  /// [excludeReplyUserId]: When used with [autoPopulateReplyMetadata], a
  /// comma-separated list of user ids which will be removed from the
  /// server-generated @mentions prefix on an extended Tweet. Note that the
  /// leading @mention cannot be removed as it would break the
  /// [inReplyToStatusId] semantics. Attempting to remove it will be silently
  /// ignored.
  ///
  /// [attachmentUrl]: In order for a URL to not be counted in the status body
  /// of an extended Tweet, provide a URL as a Tweet attachment. This URL must
  /// be a Tweet permalink, or Direct Message deep link. Arbitrary, non-Twitter
  /// URLs must remain in the status text. URLs passed to the [attachmentUrl]
  /// parameter not matching either a Tweet permalink or Direct Message deep
  /// link will fail at Tweet creation and cause an exception.
  ///
  /// [mediaIds]: A comma-delimited list of [mediaIds] to associate with the
  /// Tweet. You may include up to 4 photos or 1 animated GIF or 1 video in a
  /// Tweet. See Uploading Media for further details on uploading media.
  ///
  /// [possiblySensitive]: If you upload Tweet media that might be considered
  /// sensitive content such as nudity, or medical procedures, you must set this
  /// value to `true`.
  ///
  /// [lat]: The latitude of the location this Tweet refers to. This parameter
  /// will be ignored unless it is inside the range `-90.0` to `+90.0` (North is
  /// positive) inclusive. It will also be ignored if there is no corresponding
  /// [long] parameter.
  ///
  /// [long]: The longitude of the location this Tweet refers to. The valid
  /// ranges for longitude are `-180.0` to `+180.0` (East is positive)
  /// inclusive. This parameter will be ignored if outside that range, if it is
  /// not a number, if `geo_enabled` is disabled, or if there no corresponding
  /// lat parameter.
  /// (`geo_enabled` has to be enabled for the user.)
  ///
  /// [placeId]: A [Place] in the world.
  ///
  /// [displayCoordinates]: Whether or not to put a pin on the exact coordinates
  /// a Tweet has been sent from.
  ///
  /// [trimUser]: When set to `true`, the response will include a user object
  /// including only the author's ID.
  ///
  /// [enableDmcommands]: When set to `true`, enables shortcode commands for
  /// sending Direct Messages as part of the status text to send a Direct
  /// Message to a user. When set to `false`, disables this behavior and includes
  /// any leading characters in the status text that is posted.
  ///
  /// [failDmcommands]: When set to `true`, causes any status text that starts
  /// with shortcode commands to return an API error. When set to `false`,
  /// allows shortcode commands to be sent in the status text and acted on by
  /// the API.
  ///
  /// [cardUri]: Associate an ads card with the Tweet using the [cardUri] value
  /// from any ads card response.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to transform the response. It is recommended to
  /// handle the response in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-update.
  Future<Tweet> update({
    @required String status,
    String inReplyToStatusId,
    bool autoPopulateReplyMetadata,
    List<String> excludeReplyUserId,
    String attachmentUrl,
    List<String> mediaIds,
    bool possiblySensitive,
    double lat,
    double long,
    String placeId,
    bool displayCoordinates,
    bool trimUser,
    bool enableDmcommands,
    bool failDmcommands,
    String cardUri,
    String tweetMode = 'extended',
    TransformResponse<Tweet> transform = _defaultTweetTransformation,
  }) {
    final body = <String, String>{}
      ..addParameter('tweet_mode', tweetMode)
      ..addParameter('status', status)
      ..addParameter('in_reply_to_status_id', inReplyToStatusId)
      ..addParameter('auto_populate_reply_metadata', autoPopulateReplyMetadata)
      ..addParameter('exclude_reply_user_ids', excludeReplyUserId)
      ..addParameter('attachment_url', attachmentUrl)
      ..addParameter('media_ids', mediaIds)
      ..addParameter('possibly_sensitive', possiblySensitive)
      ..addParameter('lat', lat)
      ..addParameter('long', long)
      ..addParameter('place_id', placeId)
      ..addParameter('display_coordinates', displayCoordinates)
      ..addParameter('trim_user', trimUser)
      ..addParameter('enable_dmcommands', enableDmcommands)
      ..addParameter('fail_dmcommands', failDmcommands)
      ..addParameter('card_uri', cardUri);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/statuses/update.json'),
          body: body,
        )
        .then(transform);
  }

  /// Destroys the status specified by the required ID parameter. The
  /// authenticating user must be the author of the specified status. Returns
  /// the destroyed status if successful.
  ///
  /// [id]: The numerical ID of the desired status.
  ///
  /// [trimUser]: When `true`, each tweet returned in a timeline will include a
  /// user object including only the status authors numerical ID. Omit this
  /// parameter to receive the complete user object.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to transform the response. It is recommended to
  /// handle the response in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-destroy-id.
  Future<Tweet> destroy({
    @required String id,
    bool trimUser,
    String tweetMode = 'extended',
    TransformResponse<Tweet> transform = _defaultTweetTransformation,
  }) async {
    final body = <String, String>{}
      ..addParameter('tweet_mode', tweetMode)
      ..addParameter('trim_user', trimUser);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/statuses/destroy/$id.json'),
          body: body,
        )
        .then(transform);
  }

  /// Returns a single Tweet, specified by the [id] parameter. The Tweet's author
  /// will also be embedded within the Tweet.
  ///
  /// See [lookup] for getting Tweets in bulk (up to 100 per call).
  ///
  /// [id]: The numerical ID of the desired Tweet.
  ///
  /// [trimUser]: When `true`, each Tweet will include a user object including
  /// only the status authors numerical ID. Omit this parameter to receive the
  /// complete user object.
  ///
  /// [includeMyRetweet]: When `true`, any Tweets returned that have been
  /// retweeted by the authenticating user will include an additional node,
  /// containing the ID of the source status for the retweet.
  /// // todo: implement
  ///
  /// [includeEntities]: The entities node will not be included when set to `false`.
  ///
  /// [includeExtAltText]: If alt text has been added to any attached media
  /// entities, this parameter will return an ext_alt_text value in the
  /// top-level key for the media entity. If no value has been set, this will be
  /// returned as `null`.
  /// // todo: implement
  ///
  /// [includeCardUri]: When `true`, the retrieved Tweet will include a card_uri
  /// attribute when there is an ads card attached to the Tweet and when that
  /// card was attached using the card_uri value.
  /// // todo: implement
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to transform the response. It is recommended to
  /// handle the response in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/get-statuses-show-id.
  Future<Tweet> show({
    @required String id,
    bool trimUser,
    @notImplemented bool includeMyRetweet,
    bool includeEntities,
    @notImplemented bool includeExtAltText,
    @notImplemented bool includeCardUri,
    String tweetMode = 'extended',
    TransformResponse<Tweet> transform = _defaultTweetTransformation,
  }) {
    final params = <String, String>{}
      ..addParameter('tweet_mode', 'extended')
      ..addParameter('id', id)
      ..addParameter('trim_user', trimUser)
      ..addParameter('include_my_retweet', includeMyRetweet)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('include_ext_alt_text', includeExtAltText)
      ..addParameter('include_card_uri', includeCardUri);

    return client
        .get(Uri.https('api.twitter.com', '1.1/statuses/show.json', params))
        .then(transform);
  }

  /// Retweets a tweet. Returns the original Tweet with Retweet details
  /// embedded.
  ///
  /// [id]: The numerical ID of the desired status.
  ///
  /// [trimUser]: When `true`, each tweet returned in a timeline will include a
  /// user object including only the status authors numerical ID. Omit this
  /// parameter to receive the complete user object.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to transform the response. It is recommended to
  /// handle the response in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-unretweet-id.
  Future<Tweet> retweet({
    @required String id,
    bool trimUser,
    String tweetMode = 'extended',
    TransformResponse<Tweet> transform = _defaultTweetTransformation,
  }) async {
    final body = <String, String>{}
      ..addParameter('tweet_mode', tweetMode)
      ..addParameter('trim_user', trimUser);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/statuses/retweet/$id.json'),
          body: body,
        )
        .then(transform);
  }

  /// Untweets a retweeted status. Returns the original Tweet with Retweet
  /// details embedded.
  ///
  /// [id]: The numerical ID of the desired status.
  ///
  /// [trimUser]: When `true`, each tweet returned in a timeline will include a
  /// user object including only the status authors numerical ID. Omit this
  /// parameter to receive the complete user object.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to transform the response. It is recommended to
  /// handle the response in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/api-reference/post-statuses-unretweet-id.
  Future<Tweet> unretweet({
    @required String id,
    bool trimUser,
    String tweetMode = 'extended',
    TransformResponse<Tweet> transform = _defaultTweetTransformation,
  }) {
    final body = <String, String>{}
      ..addParameter('tweet_mode', tweetMode)
      ..addParameter('trim_user', trimUser);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/statuses/unretweet/$id.json'),
          body: body,
        )
        .then(transform);
  }
}

Tweet _defaultTweetTransformation(Response response) {
  return Tweet.fromJson((json.decode(response.body)));
}
