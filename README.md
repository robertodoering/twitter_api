# Dart wrapper for the Twitter REST API

A Dart package for using the Twitter API.

Provides a well documented interface with named parameters for each request
and parses the response into a data model.

## Twitter API key

Get your Twitter API key [here](https://developer.twitter.com/en/apply-for-access).

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

final List<Tweet> homeTimeline = await twitterApi.timelineService
    .homeTimeline(
      count: 200,
      includeEntities: false,
    )
    .catchError(handleError);
```

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
  - todo

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
  - todo

- Geo
  - todo

If an API endpoint is not yet implemented, a request can be made to that
endpoint by manually using the `TwitterClient` from the `TwitterApi` object.

Example:

```dart
// Make an authenticated get request to users/show
twitterApi.client.get(
  Uri.https('api.twitter.com', '1.1/users/show.json',
  <String, String>{
    'user_id': '1068105113284300800',
  },
);

// Make an authenticated post request to friendships/create
twitterApi.client.post(
  Uri.https('api.twitter.com', '1.1/friendships/create.json'),
  body: <String, String>{
    'user_id': '1068105113284300800',
  },
);
```

## Response transformation

Every request has a transform parameter that is used to parse the response.
When using Flutter, the request should be parsed in an isolate.

Example:

```dart
// todo
```

## Development

### To generate json_serializable models

`pub run build_runner build --delete-conflicting-outputs`
