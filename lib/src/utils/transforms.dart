import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_api/api/tweets/data/tweet.dart';

Tweet defaultTweetTransform(Response response) {
  return Tweet.fromJson((json.decode(response.body)));
}

List<Tweet> defaultTweetListTransform(Response response) {
  final tweets = <Tweet>[];

  for (Map<String, dynamic> tweetJson in json.decode(response.body)) {
    tweets.add(Tweet.fromJson(tweetJson));
  }

  return tweets;
}
