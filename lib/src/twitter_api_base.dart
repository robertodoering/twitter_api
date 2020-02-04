import 'package:meta/meta.dart';
import 'package:twitter_api/api/tweets/tweet_service.dart';
import 'package:twitter_api/api/twitter_client.dart';

class TwitterApi {
  TwitterApi({
    @required this.client,
  }) : tweetService = TweetService(client: client);

  final TwitterClient client;

  final TweetService tweetService;
}
