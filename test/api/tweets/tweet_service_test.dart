import 'dart:io';

import 'package:dart_twitter_api/api/tweets/tweet_service.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() async {
  test('`update` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/statuses/update.json'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_update.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.update(status: 'hello world');

    expect(tweet, isA<Tweet>());
  });

  test('`destroy` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/statuses/destroy/1236345.json'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_destroy.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.destroy(id: '1236345');

    expect(tweet, isA<Tweet>());
  });

  test('`show` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.get(
      Uri.https(
        'api.twitter.com',
        '1.1/statuses/show.json',
        {'tweet_mode': 'extended', 'id': '123'},
      ),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_show.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.show(id: '123');

    expect(tweet, isA<Tweet>());
  });

  test('`retweet` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/statuses/retweet/6453645.json'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_retweet.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.retweet(id: '6453645');

    expect(tweet, isA<Tweet>());
  });

  test('`unretweet` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/statuses/unretweet/7657876.json'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_unretweet.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.unretweet(id: '7657876');

    expect(tweet, isA<Tweet>());
  });

  test('`retweets` parses list of tweet objects from response', () async {
    final mockClient = MockClient();

    when(mockClient.get(
      Uri.https(
        'api.twitter.com',
        '1.1/statuses/retweets/912456.json',
        {'tweet_mode': 'extended'},
      ),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_retweets.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.retweets(id: '912456');

    expect(tweet, isA<List<Tweet>>());
  });

  test('`retweetsOfMe` parses list of tweet objects from response', () async {
    final mockClient = MockClient();

    when(mockClient.get(
      Uri.https(
        'api.twitter.com',
        '1.1/statuses/retweets_of_me.json',
        {'tweet_mode': 'extended'},
      ),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/statuses_retweets_of_me.json')
            .readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.retweetsOfMe();

    expect(tweet, isA<List<Tweet>>());
  });

  test('`createFavorite` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/favorites/create.json'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/favorites_create.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.createFavorite(id: '54367');

    expect(tweet, isA<Tweet>());
  });

  test('`destroyFavorite` parses tweet object from response', () async {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/favorites/destroy.json'),
      body: anyNamed('body'),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/favorites_destroy.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.destroyFavorite(id: '54367');

    expect(tweet, isA<Tweet>());
  });

  test('`listFavorites` parses list of tweet objects from response', () async {
    final mockClient = MockClient();

    when(mockClient.get(
      Uri.https(
        'api.twitter.com',
        '1.1/favorites/list.json',
        {'tweet_mode': 'extended'},
      ),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/tweets/data/favorites_list.json').readAsStringSync(),
        200,
        headers: {
          'content-type': 'application/json; charset=utf-8',
        },
      ),
    );

    final tweetService = TweetService(client: mockClient);

    final tweet = await tweetService.listFavorites();

    expect(tweet, isA<List<Tweet>>());
  });
}
