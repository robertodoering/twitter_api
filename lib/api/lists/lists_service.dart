import 'package:dart_twitter_api/src/annotations.dart';
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
    int? listId,
    String? slug,
    String? ownerScreenName,
    int? ownerId,
    int? count,
    int? cursor,
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
    int? listId,
    String? slug,
    String? userId,
    String? screenName,
    String? ownerScreenName,
    int? ownerId,
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
    int? cursor,
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
    int? cursor,
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
    int? listId,
    String? slug,
    String? ownerScreenName,
    int? ownerId,
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
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-statuses.
  @notImplemented
  Future<void> statuses() async {}

  /// Returns the subscribers of the specified list. Private list subscribers
  /// will only be shown if the authenticated user owns the specified list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers.
  @notImplemented
  Future<void> subscribers() async {}

  /// Check if the specified user is a subscriber of the specified list.
  /// Returns the user if they are a subscriber.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscribers-show.
  @notImplemented
  Future<void> subscribersShow() async {}

  /// Obtain a collection of the lists the specified user is subscribed to,
  /// 20 lists per page by default. Does not include the user's own lists.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-subscriptions.
  @notImplemented
  Future<void> subscriptions() async {}

  /// Creates a new list for the authenticated user. Note that you can create
  /// up to 1000 lists per account.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-create.
  @notImplemented
  Future<void> create() async {}

  /// Deletes the specified list. The authenticated user must own the list to
  /// be able to destroy it.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-destroy.
  @notImplemented
  Future<void> destroy() async {}

  /// Add a member to a list. The authenticated user must own the list to be
  /// able to add members to it. Note that lists cannot have more than 5,000
  /// members.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create.
  @notImplemented
  Future<void> membersCreate() async {}

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
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-create_all.
  @notImplemented
  Future<void> membersCreateAll() async {}

  /// Removes the specified member from the list. The authenticated user must
  /// be the list's owner to remove members from the list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy.
  @notImplemented
  Future<void> membersDestroy() async {}

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
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-members-destroy_all.
  @notImplemented
  Future<void> membersDestroyAll() async {}

  /// Subscribes the authenticated user to the specified list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-create.
  @notImplemented
  Future<void> subscribersCreate() async {}

  /// Unsubscribes the authenticated user from the specified list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-subscribers-destroy.
  @notImplemented
  Future<void> subscribersDestroy() async {}

  /// Updates the specified list. The authenticated user must own the list to
  /// be able to update it.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/post-lists-update.
  @notImplemented
  Future<void> update() async {}
}