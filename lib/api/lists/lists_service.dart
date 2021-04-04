import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:dart_twitter_api/src/annotations.dart';

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
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/api-reference/get-lists-list.
  @notImplemented
  Future<void> list() async {}

  @notImplemented
  Future<void> members() async {}

  @notImplemented
  Future<void> membersShow() async {}

  @notImplemented
  Future<void> ownership() async {}

  @notImplemented
  Future<void> show() async {}

  @notImplemented
  Future<void> statuses() async {}

  @notImplemented
  Future<void> subscribers() async {}

  @notImplemented
  Future<void> subscribersShow() async {}

  @notImplemented
  Future<void> subscriptions() async {}

  @notImplemented
  Future<void> create() async {}

  @notImplemented
  Future<void> destroy() async {}

  @notImplemented
  Future<void> membersCreate() async {}

  @notImplemented
  Future<void> membersCreateAll() async {}

  @notImplemented
  Future<void> membersDestroy() async {}

  @notImplemented
  Future<void> membersDestroyAll() async {}

  @notImplemented
  Future<void> subscribersCreate() async {}

  @notImplemented
  Future<void> subscribersDestroy() async {}

  @notImplemented
  Future<void> update() async {}
}
