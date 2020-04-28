import 'package:meta/meta.dart';
import 'package:twitter_api/api/abstract_twitter_client.dart';
import 'package:twitter_api/api/direct_messages/direct_messages_service.dart';
import 'package:twitter_api/api/media/media_service.dart';
import 'package:twitter_api/api/tweets/timeline_service.dart';
import 'package:twitter_api/api/tweets/tweet_search_service.dart';
import 'package:twitter_api/api/tweets/tweet_service.dart';

class TwitterApi {
  TwitterApi({
    @required this.client,
  })  : tweetService = TweetService(client: client),
        tweetSearchService = TweetSearchService(client: client),
        timelineService = TimelineService(client: client),
        mediaService = MediaService(client: client),
        directMessagesService = DirectMessagesService(client: client);

  final AbstractTwitterClient client;

  final TweetService tweetService;

  final TweetSearchService tweetSearchService;

  final TimelineService timelineService;

  final MediaService mediaService;

  final DirectMessagesService directMessagesService;
}
