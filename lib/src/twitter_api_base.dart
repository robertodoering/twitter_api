import 'package:dart_twitter_api/twitter_api.dart';

/// The [TwitterApi] provides the services used to make requests to the
/// Twitter API.
///
/// The [client] is used by the services to make the authenticated requests.
/// By default, the [TwitterClient] can be used.
///
/// A single app wide instance of [TwitterApi] can be used to make continuous
/// requests.
class TwitterApi {
  TwitterApi({
    required this.client,
  })  : userService = UserService(client: client),
        tweetService = TweetService(client: client),
        tweetSearchService = TweetSearchService(client: client),
        timelineService = TimelineService(client: client),
        mediaService = MediaService(client: client),
        listsService = ListsService(client: client),
        directMessagesService = DirectMessagesService(client: client),
        trendsService = TrendsService(client: client);

  /// The client to handle http requests.
  ///
  /// By default, the [TwitterClient] can be used.
  final AbstractTwitterClient client;

  /// Handles following, searching and retrieving Users.
  ///
  /// https://developer.twitter.com/en/docs/accounts-and-users/follow-search-get-users/overview.
  final UserService userService;

  /// Handles engagement with Tweets.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/post-and-engage/overview.
  final TweetService tweetService;

  /// Handles searching Tweets.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/search/overview.
  final TweetSearchService tweetSearchService;

  /// Handles retrieving Tweet timelines.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/timelines/overview.
  final TimelineService timelineService;

  /// Handles uploading Tweet media.
  ///
  /// See https://developer.twitter.com/en/docs/media/upload-media/overview.
  final MediaService mediaService;

  /// Handles creating and managing lists.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/accounts-and-users/create-manage-lists/overview.
  final ListsService listsService;

  /// Handles sending and receiving direct message events.
  ///
  /// See https://developer.twitter.com/en/docs/media/upload-media/overview.
  final DirectMessagesService directMessagesService;

  /// An API to return the trending topics near a specific latitude, longitude
  /// location.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/overview.
  final TrendsService trendsService;
}
