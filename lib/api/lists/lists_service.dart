import 'package:dart_twitter_api/src/utils/map_utils.dart';
import 'package:dart_twitter_api/twitter_api.dart';

/// A list is a curated group of Twitter accounts. You can create your own
/// lists or subscribe to lists created by others for the authenticated user.
///
/// Viewing a list timeline will show you a stream of Tweets from only the
/// accounts on that list.
///
/// Endpoints:
/// GET lists/members
/// GET lists/members/show
/// GET lists/memberships
/// GET lists/ownerships
/// GET lists/show
/// GET lists/statuses
/// GET lists/subscribers
/// GET lists/subscribers/show
/// GET lists/subscriptions
///
/// POST lists/create
/// POST lists/destroy
/// POST lists/members/create
/// POST lists/members/create_all
/// POST lists/members/destroy
/// POST lists/members/destroy_all
/// POST lists/subscribers/create
/// POST lists/subscribers/destroy
/// POST lists/update
///
/// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/overview.
class ListsService {
  const ListsService({
    required this.client,
  });

  final AbstractTwitterClient client;

  /// Returns all lists the authenticating or specified user subscribes to,
  /// including their own.
  ///
  /// The user is specified using the [userId] or
  /// [screenName] parameters. If no user is given, the authenticating user is
  /// used.
  ///
  /// A maximum of 100 results will be returned by this call. Subscribed lists
  /// are returned first, followed by owned lists.This means that if a user
  /// subscribes to 90 lists and owns 20 lists, this method returns 90
  /// subscriptions and 10 owned lists. The [reverse] method returns owned lists
  /// first, so with [reverse]=`true`, 20 owned lists and 80 subscriptions
  /// would be returned. If your goal is to obtain every list a user owns or
  /// subscribes to, use [ownerships] and/or [subscriptions] instead.
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// [reverse] Set this to `true` if you would like owned lists to be
  /// returned first.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list.
  Future<List<TwitterList>> list({
    String? userId,
    String? screenName,
    bool? reverse,
    TransformResponse<List<TwitterList>> transform =
        defaultTwitterListsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('reverse', reverse);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/list.json', params))
        .then(transform);
  }

  /// Returns the members of the specified list. Private list members will
  /// only be shown if the authenticated user owns the specified list.
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [count] Specifies the number of results to return per page (see
  /// [cursor]). The default is `20`, with a maximum of 5,000.
  ///
  /// [cursor] Causes the collection of list members to be broken into "pages"
  /// of consistent sizes (specified by the count parameter). If no cursor
  /// is provided, a value of `-1` will be assumed, which is the first "page".
  ///
  /// [includeEntities] The entities node will not be included when set to
  /// `false`.
  ///
  /// [skipStatus] When set to `true` statuses will not be included in the
  /// returned user objects.
  ///
  /// [tweetMode] When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members.
  Future<PaginatedUsers> members({
    String? listId,
    String? slug,
    String? ownerScreenName,
    String? ownerId,
    int? count,
    String? cursor,
    bool? includeEntities,
    bool? skipStatus,
    String tweetMode = 'extended',
    TransformResponse<PaginatedUsers> transform =
        defaultPaginatedUsersTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('count', count)
      ..addParameter('cursor', cursor)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('skip_status', skipStatus)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/members.json', params))
        .then(transform);
  }

  /// Check if the specified user is a member of the specified list.
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [includeEntities] The entities node will not be included when set to
  /// `false`.
  ///
  /// [skipStatus] When set to `true` statuses will not be included in the
  /// returned user objects.
  ///
  /// [tweetMode] When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members-show.
  Future<User> membersShow({
    String? listId,
    String? slug,
    String? userId,
    String? screenName,
    String? ownerScreenName,
    String? ownerId,
    bool? includeEntities,
    bool? skipStatus,
    String tweetMode = 'extended',
    TransformResponse<User> transform = defaultUserTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('skip_status', skipStatus)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(
          Uri.https('api.twitter.com', '1.1/lists/members/show.json', params),
        )
        .then(transform);
  }

  /// Returns the lists the specified user has been added to. If [userId] or
  /// [screenName] are not provided, the memberships for the authenticating
  /// user are returned.
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// [count] The amount of results to return per page. Defaults to 20. No
  /// more than 1000 results will ever be returned in a single page.
  ///
  /// [cursor] Breaks the results into pages. Provide a value of `-1` to begin
  /// paging. Provide values as returned in the response body's `nextCursor`
  /// and `previousCursor` attributes to page back and forth in the list.
  ///
  /// [filterToOwnedLists] When set to `true`, will return just lists the
  /// authenticating user owns, and the user represented by [userId] or
  /// [screenName] is a member of.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships.
  Future<PaginatedTwitterLists> memberships({
    String? userId,
    String? screenName,
    int? count,
    String? cursor,
    bool? filterToOwnedLists,
    TransformResponse<PaginatedTwitterLists> transform =
        defaultPaginatedTwitterListsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('count', count)
      ..addParameter('cursor', cursor)
      ..addParameter('filter_to_owned_lists', filterToOwnedLists);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/memberships.json', params))
        .then(transform);
  }

  /// Returns the lists owned by the specified Twitter user. Private lists
  /// will only be shown if the authenticated user is also the owner of the
  /// lists.
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// [count] The amount of results to return per page. Defaults to 20. No
  /// more than 1000 results will ever be returned in a single page.
  ///
  /// [cursor] Breaks the results into pages. Provide a value of `-1` to begin
  /// paging. Provide values as returned in the response body's `nextCursor`
  /// and `previousCursor` attributes to page back and forth in the list.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-ownerships.
  Future<PaginatedTwitterLists> ownerships({
    String? userId,
    String? screenName,
    int? count,
    String? cursor,
    TransformResponse<PaginatedTwitterLists> transform =
        defaultPaginatedTwitterListsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('count', count)
      ..addParameter('cursor', cursor);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/ownerships.json', params))
        .then(transform);
  }

  /// Returns the specified list. Private lists will only be shown if the
  /// authenticated user owns the specified list.
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show.
  Future<TwitterList> show({
    String? listId,
    String? slug,
    String? ownerScreenName,
    String? ownerId,
    TransformResponse<TwitterList> transform = defaultTwitterListTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/show.json', params))
        .then(transform);
  }

  /// Returns a timeline of tweets authored by members of the specified list.
  /// Retweets are included by default. Use the [includeRts]=false parameter
  /// to omit retweets.
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [sinceId] Returns results with an ID greater than (that is, more recent
  /// than) the specified ID. There are limits to the number of Tweets which
  /// can be accessed through the API. If the limit of Tweets has occurred
  /// since the [sinceId], the [sinceId] will be forced to the oldest ID
  /// available.
  ///
  /// [maxId] Returns results with an ID less than (that is, older than) or
  /// equal to the specified ID.
  ///
  /// [count] Specifies the number of results to retrieve per "page."
  ///
  /// [includeEntities] Entities are ON by default in API 1.1, each tweet
  /// includes a node called "entities". This node offers a variety of
  /// metadata about the tweet in a discreet structure, including:
  /// user_mentions, urls, and hashtags. You can omit entities from the
  /// result by using [includeEntities]=false
  ///
  /// [includeRts] When set to `true`, the list timeline will contain native
  /// retweets (if they exist) in addition to the standard stream of tweets.
  /// The output format of retweeted tweets is identical to the
  /// representation you see in home_timeline.
  ///
  /// [tweetMode] When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses.
  Future<List<Tweet>> statuses({
    String? listId,
    String? slug,
    String? ownerScreenName,
    String? ownerId,
    String? sinceId,
    String? maxId,
    int? count,
    bool? includeEntities,
    bool? includeRts,
    bool? includeExtEditControl,
    String tweetMode = 'extended',
    TransformResponse<List<Tweet>> transform = defaultTweetListTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('since_id', sinceId)
      ..addParameter('max_id', maxId)
      ..addParameter('count', count)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('include_rts', includeRts)
      ..addParameter('include_ext_edit_control', includeExtEditControl)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/statuses.json', params))
        .then(transform);
  }

  /// Returns the subscribers of the specified list. Private list subscribers
  /// will only be shown if the authenticated user owns the specified list.
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [count] Specifies the number of results to retrieve per "page."
  ///
  /// [cursor] Breaks the results into pages. A single page contains 20 lists
  /// . Provide a value of `-1` to begin paging.
  ///
  /// [includeEntities] The entities node will not be included when set to
  /// `false`.
  ///
  /// [skipStatus] When set to `true` statuses will not be included in the
  /// returned user objects.
  ///
  /// [tweetMode] When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers.
  Future<PaginatedUsers> subscribers({
    String? listId,
    String? slug,
    String? ownerScreenName,
    String? ownerId,
    int? count,
    String? cursor,
    bool? includeEntities,
    bool? skipStatus,
    String tweetMode = 'extended',
    TransformResponse<PaginatedUsers> transform =
        defaultPaginatedUsersTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('count', count)
      ..addParameter('cursor', cursor)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('skip_status', skipStatus)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/lists/subscribers.json', params))
        .then(transform);
  }

  /// Check if the specified user is a subscriber of the specified list.
  /// Returns the user if they are a subscriber.
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// [includeEntities] The entities node will not be included when set to
  /// `false`.
  ///
  /// [skipStatus] When set to `true` statuses will not be included in the
  /// returned user objects.
  ///
  /// [tweetMode] When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show.
  Future<User> subscribersShow({
    String? listId,
    String? slug,
    String? ownerScreenName,
    String? ownerId,
    String? userId,
    String? screenName,
    bool? includeEntities,
    bool? skipStatus,
    String tweetMode = 'extended',
    TransformResponse<User> transform = defaultUserTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('skip_status', skipStatus)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(
          Uri.https(
            'api.twitter.com',
            '1.1/lists/subscribers/show.json',
            params,
          ),
        )
        .then(transform);
  }

  /// Obtain a collection of the lists the specified user is subscribed to,
  /// 20 lists per page by default. Does not include the user's own lists.
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// [count] Specifies the number of results to retrieve per "page."
  ///
  /// [cursor] Breaks the results into pages. A single page contains 20 lists
  /// . Provide a value of `-1` to begin paging.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions.
  Future<PaginatedTwitterLists> subscriptions({
    String? userId,
    String? screenName,
    String? count,
    String? cursor,
    TransformResponse<PaginatedTwitterLists> transform =
        defaultPaginatedTwitterListsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('count', count)
      ..addParameter('cursor', cursor);

    return client
        .get(
          Uri.https('api.twitter.com', '1.1/lists/subscriptions.json', params),
        )
        .then(transform);
  }

  /// Creates a new list for the authenticated user. Note that you can create
  /// up to 1000 lists per account.
  ///
  /// [name] The name for the list. A list's name must start with a letter
  /// and can consist only of 25 or fewer letters, numbers, "-", or "_"
  /// characters.
  ///
  /// [mode] Whether your list is public or private. Values can be public or
  /// private . If no mode is specified the list will be public.
  ///
  /// [description] The description to give the list.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create.
  Future<TwitterList> create({
    String? name,
    String? mode,
    String? description,
    TransformResponse<TwitterList> transform = defaultTwitterListTransform,
  }) async {
    final body = <String, String>{}
      ..addParameter('name', name)
      ..addParameter('mode', mode)
      ..addParameter('description', description);

    return client
        .post(Uri.https('api.twitter.com', '1.1/lists/create.json'), body: body)
        .then(transform);
  }

  /// Deletes the specified list. The authenticated user must own the list to
  /// be able to destroy it.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy.
  Future<TwitterList> destroy({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    TransformResponse<TwitterList> transform = defaultTwitterListTransform,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/lists/destroy.json'),
          body: body,
        )
        .then(transform);
  }

  /// Add a member to a list. The authenticated user must own the list to be
  /// able to add members to it. Note that lists cannot have more than 5,000
  /// members.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [userId] The ID of the user for whom to return results.
  ///
  /// [screenName] The screen name of the user for whom to return results.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create.
  Future<void> membersCreate({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    String? userId,
    String? screenName,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName);

    await client.post(
      Uri.https('api.twitter.com', '1.1/lists/members/create.json'),
      body: body,
    );
  }

  /// Adds multiple members to a list, by specifying a comma-separated list
  /// of member ids or screen names. The authenticated user must own the list
  /// to be able to add members to it. Note that lists can't have more than
  /// 5,000 members, and you are limited to adding up to 100 members to a
  /// list at a time with this method.
  ///
  /// Please note that there can be issues with lists that rapidly remove and
  /// add memberships. Take care when using these methods such that you are
  /// not too rapidly switching between removals and adds on the same list.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [userId] A list of user IDs, up to 100 are allowed in a single request.
  ///
  /// [screenName] A comma separated list of screen names, up to 100 are
  /// allowed in a single request.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create_all.
  Future<void> membersCreateAll({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    List<String>? userId,
    List<String>? screenName,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName);

    await client.post(
      Uri.https('api.twitter.com', '1.1/lists/members/create_all.json'),
      body: body,
    );
  }

  /// Removes the specified member from the list. The authenticated user must
  /// be the list's owner to remove members from the list.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [userId] The ID of the user to remove from the list.
  ///
  /// [screenName] The screen name of the user for whom to remove from the list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy.
  Future<void> membersDestroy({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    String? userId,
    String? screenName,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName);

    await client.post(
      Uri.https('api.twitter.com', '1.1/lists/members/destroy.json'),
      body: body,
    );
  }

  /// Removes multiple members from a list, by specifying a comma-separated
  /// list of member ids or screen names. The authenticated user must own the
  /// list to be able to remove members from it. Note that lists can't have
  /// more than 500 members, and you are limited to removing up to 100
  /// members to a list at a time with this method.
  ///
  /// Please note that there can be issues with lists that rapidly remove and
  /// add memberships. Take care when using these methods such that you are
  /// not too rapidly switching between removals and adds on the same list.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [userId] A list of user IDs, up to 100 are allowed in a single request.
  ///
  /// [screenName] A comma separated list of screen names, up to 100 are
  /// allowed in a single request.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all.
  Future<void> membersDestroyAll({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    List<String>? userId,
    List<String>? screenName,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName);

    await client.post(
      Uri.https('api.twitter.com', '1.1/lists/members/destroy_all.json'),
      body: body,
    );
  }

  /// Subscribes the authenticated user to the specified list.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [transform] Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-create.
  Future<TwitterList> subscribersCreate({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    TransformResponse<TwitterList> transform = defaultTwitterListTransform,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug);

    return client
        .post(
          Uri.https('api.twitter.com', '1.1/lists/subscribers/create.json'),
          body: body,
        )
        .then(transform);
  }

  /// Unsubscribes the authenticated user from the specified list.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-destroy.
  Future<void> subscribersDestroy({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug);

    await client.post(
      Uri.https('api.twitter.com', '1.1/lists/subscribers/destroy.json'),
      body: body,
    );
  }

  /// Updates the specified list. The authenticated user must own the list to
  /// be able to update it.
  ///
  /// [ownerScreenName] The screen name of the user who owns the list being
  /// requested by a [slug].
  ///
  /// [ownerId] The user ID of the user who owns the list being requested by
  /// a [slug].
  ///
  /// [listId] The numerical id of the list.
  ///
  /// [slug] You can identify a list by its slug instead of its numerical id.
  /// If you decide to do so, note that you'll also have to specify the list
  /// owner using the [ownerId] or [ownerScreenName] parameters.
  ///
  /// [name] The name for the list.
  ///
  /// [mode] Whether your list is public or private. Values can be `public` or
  /// `private`. If no mode is specified the list will be public.
  ///
  /// [description] The description to give the list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update.
  Future<void> update({
    String? ownerScreenName,
    String? ownerId,
    String? listId,
    String? slug,
    String? name,
    String? mode,
    String? description,
  }) async {
    final body = <String, String>{}
      ..addParameter('owner_screen_name', ownerScreenName)
      ..addParameter('owner_id', ownerId)
      ..addParameter('list_id', listId)
      ..addParameter('slug', slug)
      ..addParameter('name', name)
      ..addParameter('mode', mode)
      ..addParameter('description', description);

    await client.post(
      Uri.https('api.twitter.com', '1.1/lists/update.json'),
      body: body,
    );
  }
}
