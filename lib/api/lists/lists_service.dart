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
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members.
  @notImplemented
  Future<void> members() async {}

  /// Check if the specified user is a member of the specified list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-members-show.
  @notImplemented
  Future<void> membersShow() async {}

  /// Returns the lists the specified user has been added to. If [userId] or
  /// [screenName] are not provided, the memberships for the authenticating
  /// user are returned.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-memberships.
  @notImplemented
  Future<void> ownerships() async {}

  /// Returns the specified list. Private lists will only be shown if the
  /// authenticated user owns the specified list.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-show.
  @notImplemented
  Future<void> show() async {}

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
