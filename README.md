# A Dart wrapper for the Twitter API

This dart package provides a well documented wrapper for the [Twitter
API](https://developer.twitter.com/).

## Why use this package?

To make the usage as comfortable as possible, this package provides interfaces
for the various endpoints of the Twitter API. Documentation for each request is
available as dart docs and each request's parameters can be changed as named
parameters.

The various data structures returned by Twitter are parsed into data models in
an isolate.

## Example usage

```dart
final TwitterApi twitterApi = TwitterApi(
  client: TwitterClient(
    consumerKey: 'your_consumer_key',
    consumerSecret: 'your_consumer_secret',
    token: 'your_token',
    secret: 'your_secret',
  ),
);

// Get the last 200 tweets from your home timeline
final List<Tweet> homeTimeline = await twitterApi.timelineService
    .homeTimeline(
      count: 200,
      includeEntities: false,
    )
    .catchError(handleError);

// Print the text of each Tweet
tweets.forEach((tweet) => print(tweet.fullText))
```

## Twitter API key

Get your Twitter API key
[here](https://developer.twitter.com/en/apply-for-access).

## Features

### Implemented endpoints

- Accounts and users
  - [ ] Manage account settings and profile
  - [ ] Mute, block, and report users
  - [ ] Follow, search, and get users
    - [ ] followers/ids
    - [x] followers/list
    - [ ] friends/ids
    - [x] friends/list
    - [ ] friendships/incoming
    - [ ] friendships/lookup
    - [ ] friendships/no_retweets/ids
    - [ ] friendships/outgoing
    - [ ] friendships/show
    - [ ] users/lookup
    - [x] users/search
    - [x] users/show
    - [x] friendships/create
    - [x] friendships/destroy
    - [ ] friendships/update
  - [ ] Create and manage lists

- Tweets
  - [ ] Post, retrieve, and engage with Tweets
    - [x] statuses/update
    - [x] statuses/destroy/:id
    - [x] statuses/show/:id
    - [ ] statuses/lookup
    - [x] statuses/retweet/:id
    - [x] statuses/unretweet/:id
    - [x] statuses/retweets/:id
    - [x] statuses/retweets_of_me
    - [ ] statuses/retweeters/ids
    - [x] favorites/create/:id
    - [x] favorites/destroy/:id
    - [x] favorites/list
  - [x] Get Tweet timelines
  - [ ] Curate a collection of Tweets
  - [ ] Search Tweets
    - [x] Standard search API
    - [ ] Premium search APIs
    - [ ] Enterprise search APIs

- Direct Messages
  - not yet implemented

- Media
  - [ ] Upload media
    - [x] media/upload (INIT)
    - [x] media/upload (APPEND)
    - [x] media/upload (STATUS)
    - [x] media/upload (FINALIZE)
    - [ ] media/metadata/create
    - [ ] media/subtitles/delete
    - [ ] media/subtitles/create

- Trends
  - not yet implemented

- Geo
  - not yet implemented

---

If an API endpoint is not yet implemented, a request can be made to that
endpoint by manually using the `TwitterClient` from the `TwitterApi` object.

See [Making a custom request to the Twitter
API](https://github.com/robertodoering/twitter_api/wiki/Making-a-custom-request-to-the-Twitter-API)
for an example.

---

For an example of uploading media files to Twitter, see [Attaching media to a
Tweet](https://github.com/robertodoering/twitter_api/wiki/Attaching-media-to-a-Tweet).

## Development

### Contribution

I appreciate any contributions to this package. Any not yet implemented endpoints can
be added similarly to the other implementations.
Please make sure `dartanalyzer` doesn't report any problems before opening a pull request.

### Miscellaneous

- To generate json_serializable models
  - `pub run build_runner build --delete-conflicting-outputs`
