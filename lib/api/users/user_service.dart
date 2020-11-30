import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:dart_twitter_api/api/twitter_client.dart';
import 'package:dart_twitter_api/api/users/data/friendship.dart';
import 'package:dart_twitter_api/api/users/data/paginated_users.dart';
import 'package:dart_twitter_api/api/users/data/user.dart';
import 'package:dart_twitter_api/src/annotations.dart';
import 'package:dart_twitter_api/src/utils/map_utils.dart';
import 'package:dart_twitter_api/src/utils/transforms.dart';
import 'package:meta/meta.dart';

class UserService {
  const UserService({
    @required this.client,
  });

  final AbstractTwitterClient client;

  /// Returns a cursored collection of user IDs for every user following the
  /// specified user.
  ///
  /// At this time, results are ordered with the most recent following first —
  /// however, this ordering is subject to unannounced change and eventual
  /// consistency issues. Results are given in groups of 5,000 user IDs and
  /// multiple "pages" of results can be navigated through using the
  /// [nextCursor] value in subsequent requests. See
  /// https://developer.twitter.com/en/docs/basics/cursoring to navigate
  /// collections for more information.
  ///
  /// This method is especially powerful when used in conjunction with
  /// [usersLookup], a method that allows you to convert user IDs into full user
  /// objects in bulk.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-followers-ids.
  @notImplemented
  Future<void> followersIds() async {}

  /// Returns a cursored collection of user objects for users following the
  /// specified user.
  ///
  /// At this time, results are ordered with the most recent following first —
  /// however, this ordering is subject to unannounced change and eventual
  /// consistency issues. Results are given in groups of 20 users and multiple
  /// "pages" of results can be navigated through using the [nextCursor] value
  /// in subsequent requests. See
  /// https://developer.twitter.com/en/docs/basics/cursoring to navigate
  /// collections for more information.
  ///
  /// [userId]: The ID of the user for whom to return results.
  ///
  /// [screenName]: The screen name of the user for whom to return results.
  ///
  /// [cursor]: Causes the results to be broken into pages. If no cursor is
  /// provided, a value of `-1` will be assumed, which is the first "page."
  ///
  /// The response from the API will include a [previousCursor] and [nextCursor]
  /// to allow paging back and forth. See Using cursors to navigate collections
  /// for more information.
  ///
  /// [count]: The number of users to return per page, up to a maximum of 200.
  /// Defaults to 20.
  ///
  /// [skipStatus]: When set to `true`, statuses will not be included in the
  /// returned user objects. If set to any other value, statuses will be
  /// included.
  ///
  /// [includeUserEntities]: The user object entities node will not be included
  /// when set to `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-followers-list.
  @notImplemented
  Future<PaginatedUsers> followersList({
    String userId,
    String screenName,
    int cursor,
    int count,
    bool skipStatus,
    bool includeUserEntities,
    String tweetMode = 'extended',
    TransformResponse<PaginatedUsers> transform =
        defaultPaginatedUsersTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('cursor', cursor)
      ..addParameter('count', count)
      ..addParameter('skip_status', skipStatus)
      ..addParameter('include_user_entities', includeUserEntities)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/followers/list.json', params))
        .then(transform);
  }

  /// Returns a cursored collection of user IDs for every user the specified
  /// user is following (otherwise known as their "friends").
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friends-ids.
  @notImplemented
  Future<void> friendsIds() async {}

  /// Returns a cursored collection of user objects for every user the specified
  /// user is following (otherwise known as their "friends").
  ///
  /// At this time, results are ordered with the most recent following first —
  /// however, this ordering is subject to unannounced change and eventual
  /// consistency issues. Results are given in groups of 20 users and multiple
  /// "pages" of results can be navigated through using the [nextCursor] value
  /// in subsequent requests. See
  /// https://developer.twitter.com/en/docs/basics/cursoring to navigate
  /// collections for more information.
  ///
  /// [userId]: The ID of the user for whom to return results.
  ///
  /// [screenName]: The screen name of the user for whom to return results.
  ///
  /// [cursor]: Causes the results to be broken into pages. If no cursor is
  /// provided, a value of `-1` will be assumed, which is the first "page."
  ///
  /// The response from the API will include a [previousCursor] and [nextCursor]
  /// to allow paging back and forth. See Using cursors to navigate collections
  /// for more information.
  ///
  /// [count]: The number of users to return per page, up to a maximum of 200.
  /// Defaults to 20.
  ///
  /// [skipStatus]: When set to `true`, statuses will not be included in the
  /// returned user objects. If set to any other value, statuses will be
  /// included.
  ///
  /// [includeUserEntities]: The user object entities node will not be included
  /// when set to `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friends-list.
  Future<PaginatedUsers> friendsList({
    String userId,
    String screenName,
    int cursor,
    int count,
    bool skipStatus,
    bool includeUserEntities,
    String tweetMode = 'extended',
    TransformResponse<PaginatedUsers> transform =
        defaultPaginatedUsersTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('cursor', cursor)
      ..addParameter('count', count)
      ..addParameter('skip_status', skipStatus)
      ..addParameter('include_user_entities', includeUserEntities)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/friends/list.json', params))
        .then(transform);
  }

  /// Returns a collection of numeric IDs for every user who has a pending
  /// request to follow the authenticating user.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-incoming.
  @notImplemented
  Future<void> friendshipsIncoming() async {}

  /// Returns the relationships of the authenticating user to the
  /// list of up to 100 [screenNames] or [userIds] provided.
  ///
  /// Values for [Friendship.connections] can be: `following`,
  /// `following_requested`, `followed_by`, `none`, `blocking`, `muting`.
  ///
  /// [screenNames]: A list of screen names, up to 100 are allowed in a single
  /// request.
  ///
  /// [userIds]: A list of user IDs, up to 100 are allowed in a single request.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup.
  Future<List<Friendship>> friendshipsLookup({
    List<String> screenNames,
    List<String> userIds,
    TransformResponse<List<Friendship>> transform = defaultFriendshipsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userIds)
      ..addParameter('screen_name', screenNames);

    return client
        .get(
          Uri.https('api.twitter.com', '1.1/friendships/lookup.json', params),
        )
        .then(transform);
  }

  /// Returns a collection of [userIds] that the currently authenticated user
  /// does not want to receive retweets from.
  ///
  /// Use [friendshipsUpdate] to set the "no retweets" status for a given user
  /// account on behalf of the current user.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-no_retweets-ids.
  @notImplemented
  Future<void> friendshipsNoRetweetsIds() async {}

  /// Returns a collection of numeric IDs for every protected user for whom the
  /// authenticating user has a pending follow request.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-outgoing.
  @notImplemented
  Future<void> friendshipsOutgoing() async {}

  /// Returns detailed information about the relationship between two arbitrary
  /// users.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-show.
  @notImplemented
  Future<void> friendshipsShow() async {}

  /// Returns fully-hydrated user objects for up to 100 users per request, as
  /// specified by comma-separated values passed to the [userId] and/or
  /// [screenName] parameters.
  ///
  /// This method is especially useful when used in conjunction with collections
  /// of user IDs returned from [friendsIds] and [followersIds].
  ///
  /// [usersShow] is used to retrieve a single user object.
  ///
  /// There are a few things to note when using this method.
  ///
  /// * You must be following a protected user to be able to see their most
  ///   recent status update. If you don't follow a protected user their status
  ///   will be removed.
  /// * The order of user IDs or screen names may not match the order of users
  ///   in the returned array.
  /// * If a requested user is unknown, suspended, or deleted, then that user
  ///   will not be returned in the results list.
  /// * If none of your lookup criteria can be satisfied by returning a user
  ///   object, a HTTP 404 will be thrown.
  /// * You are strongly encouraged to use a POST for larger requests.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-lookup.
  @notImplemented
  Future<void> usersLookup() async {}

  /// Provides a simple, relevance-based search interface to public user
  /// accounts on Twitter. Try querying by topical interest, full name, company
  /// name, location, or other criteria. Exact match searches are not supported.
  ///
  /// Only the first 1,000 matching results are available.
  ///
  /// [q]: The search query to run against people search.
  ///
  /// [page]: Specifies the page of results to retrieve.
  ///
  /// [count]: The number of potential user results to retrieve per page. This
  /// value has a maximum of 20.
  ///
  /// [includeEntities]: The entities node will not be included in embedded
  /// Tweet objects when set to `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-search.
  Future<List<User>> usersSearch({
    @required String q,
    int page,
    int count,
    bool includeEntities,
    String tweetMode = 'extended',
    TransformResponse<List<User>> transform = defaultUserListTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('q', q)
      ..addParameter('page', page)
      ..addParameter('count', count)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/users/search.json', params))
        .then(transform);
  }

  /// Returns a variety of information about the user specified by the required
  /// [userId] or [screenName] parameter. The author's most recent Tweet will be
  /// returned inline when possible.
  ///
  /// [usersLookup] is used to retrieve a bulk collection of user objects.
  ///
  /// You must be following a protected user to be able to see their most recent
  /// Tweet. If you don't follow a protected user, the user's Tweet will be
  /// removed. A Tweet will not always be returned in the [currentStatus] field.
  ///
  /// [userId]: The ID of the user for whom to return results.
  /// Either an id or [screenName] is required for this method.
  ///
  /// [screenName]: The screen name of the user for whom to return results.
  /// Either an id or [screenName] is required for this method.
  ///
  /// [includeEntities]: The entities node will not be included when set to
  /// `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-show.
  Future<User> usersShow({
    String userId,
    String screenName,
    bool includeEntities,
    String tweetMode = 'extended',
    TransformResponse<User> transform = defaultUserTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/users/show.json', params))
        .then(transform);
  }

  /// Allows the authenticating user to follow (friend) the user specified in
  /// the ID parameter.
  ///
  /// Returns the followed user when successful. Returns a string describing the
  /// failure condition when unsuccessful. If the user is already friends with
  /// the user a HTTP 403 may be returned, though for performance reasons this
  /// method may also return a HTTP 200 OK message even if the follow
  /// relationship already exists.
  ///
  /// Actions taken in this method are asynchronous. Changes will be eventually
  /// consistent.
  ///
  /// [userId]: The ID of the user to follow.
  ///
  /// [screenName]: The screen name of the user to follow.
  ///
  /// [follow]: Enable notifications for the target user.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-create.
  Future<User> friendshipsCreate({
    String userId,
    String screenName,
    bool follow,
    String tweetMode = 'extended',
    TransformResponse<User> transform = defaultUserTransform,
  }) async {
    final body = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('follow', follow)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/friendships/create.json'),
          body: body,
        )
        .then(transform);
  }

  /// Allows the authenticating user to unfollow the user specified in the ID
  /// parameter.
  ///
  /// Returns the unfollowed user when successful. Returns a string describing
  /// the failure condition when unsuccessful.
  ///
  /// Actions taken in this method are asynchronous. Changes will be eventually
  /// consistent.
  ///
  /// [userId]: The ID of the user to unfollow.
  ///
  /// [screenName]: The screen name of the user to unfollow.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-destroy.
  Future<User> friendshipsDestroy({
    String userId,
    String screenName,
    String tweetMode = 'extended',
    TransformResponse<User> transform = defaultUserTransform,
  }) async {
    final body = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/friendships/destroy.json'),
          body: body,
        )
        .then(transform);
  }

  /// Enable or disable Retweets and device notifications from the specified
  /// user.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-update.
  @notImplemented
  Future<void> friendshipsUpdate() async {}
}
