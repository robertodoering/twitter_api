import 'package:meta/meta.dart';
import 'package:twitter_api/api/twitter_client.dart';
import 'package:twitter_api/src/annotations.dart';

class UserService {
  const UserService({
    @required this.client,
  });

  final TwitterClient client;

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
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-followers-list.
  @notImplemented
  Future<void> followersList() async {}

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
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friends-list.
  @notImplemented
  Future<void> friendsList() async {}

  /// Returns a collection of numeric IDs for every user who has a pending
  /// request to follow the authenticating user.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-incoming.
  @notImplemented
  Future<void> friendshipsIncoming() async {}

  /// Returns the relationships of the authenticating user to the
  /// comma-separated list of up to 100 [screenNames] or [userIds] provided.
  /// Values for connections can be: `following`, `following_requested`,
  /// `followed_by`, `none`, `blocking`, `muting`.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-friendships-lookup.
  @notImplemented
  Future<void> friendshipsLookup() async {}

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
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-search.
  @notImplemented
  Future<void> usersSearch() async {}

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
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/get-users-show.
  @notImplemented
  Future<void> usersShow() async {}

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
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-create.
  @notImplemented
  Future<void> friendshipsCreate() async {}

  /// Allows the authenticating user to unfollow the user specified in the ID
  /// parameter.
  ///
  /// Returns the unfollowed user when successful. Returns a string describing
  /// the failure condition when unsuccessful.
  ///
  /// Actions taken in this method are asynchronous. Changes will be eventually
  /// consistent.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-destroy.
  @notImplemented
  Future<void> friendshipsDestroy() async {}

  /// Enable or disable Retweets and device notifications from the specified
  /// user.
  ///
  /// TODO: implement
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/api-reference/post-friendships-update.
  @notImplemented
  Future<void> friendshipsUpdate() async {}
}
