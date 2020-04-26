import 'dart:convert';

import 'package:http/http.dart';
import 'package:twitter_api/api/media/data/media_upload.dart';
import 'package:twitter_api/api/tweets/data/tweet.dart';
import 'package:twitter_api/api/tweets/data/tweet_search.dart';
import 'package:twitter_api/api/users/data/paginated_users.dart';
import 'package:twitter_api/api/users/data/user.dart';

Tweet defaultTweetTransform(Response response) {
  return Tweet.fromJson(json.decode(response.body));
}

List<Tweet> defaultTweetListTransform(Response response) {
  final tweets = <Tweet>[];

  for (Map<String, dynamic> tweetJson in json.decode(response.body)) {
    tweets.add(Tweet.fromJson(tweetJson));
  }

  return tweets;
}

User defaultUserTransform(Response response) {
  return User.fromJson(json.decode(response.body));
}

List<User> defaultUserListTransform(Response response) {
  final users = <User>[];

  for (Map<String, dynamic> userJson in json.decode(response.body)) {
    users.add(User.fromJson(userJson));
  }

  return users;
}

PaginatedUsers defaultPaginatedUsersTransform(Response response) {
  return PaginatedUsers.fromJson(json.decode(response.body));
}

UploadInit defaultUploadInitTransform(Response response) {
  return UploadInit.fromJson(json.decode(response.body));
}

UploadStatus defaultUploadStatusTransform(Response response) {
  return UploadStatus.fromJson(json.decode(response.body));
}

UploadFinalize defaultUploadFinalizeTransform(Response response) {
  return UploadFinalize.fromJson(json.decode(response.body));
}

TweetSearch defaultTweetSearchTransform(Response response) {
  return TweetSearch.fromJson(json.decode(response.body));
}
