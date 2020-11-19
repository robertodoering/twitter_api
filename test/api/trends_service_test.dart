import 'dart:io';

import 'package:dart_twitter_api/api/trends/data/trends.dart';
import 'package:dart_twitter_api/api/trends/trends_service.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'mock_client.dart';

void main() {
  group('place', () {
    test('parses trends list from response', () async {
      final mockClient = MockClient();

      when(mockClient.get(
        Uri.https('api.twitter.com', '1.1/trends/place.json', {'id': '1'}),
      )).thenAnswer(
        (_) async => Response(
          // '{}',
          File('test/api/data/trends_response.json').readAsStringSync(),
          200,
          headers: {
            'content-type': 'application/json; charset=utf-8',
          },
        ),
      );

      final trendsService = TrendsService(client: mockClient);

      final trends = await trendsService.place(id: 1);

      expect(trends, isA<List<Trends>>());
      expect(trends.length, equals(1));
      expect(trends.single.trends, isNotEmpty);
      expect(trends.single.asOf, isA<DateTime>());
      expect(trends.single.createdAt, isA<DateTime>());
      expect(trends.single.locations.length, equals(1));
    });

    test('parses trend object from response', () async {
      final mockClient = MockClient();

      when(mockClient.get(
        Uri.https('api.twitter.com', '1.1/trends/place.json', {'id': '1'}),
      )).thenAnswer(
        (_) async => Response(
          // '{}',
          File('test/api/data/trends_response.json').readAsStringSync(),
          200,
          headers: {
            'content-type': 'application/json; charset=utf-8',
          },
        ),
      );

      final trendsService = TrendsService(client: mockClient);

      final trends = await trendsService.place(id: 1);

      expect(trends.single.trends.first.name, equals('#ChainedToTheRhythm'));
      expect(
        trends.single.trends.first.url,
        equals('http://twitter.com/search?q=%23ChainedToTheRhythm'),
      );
      expect(trends.single.trends.first.promotedContent, isNull);
      expect(trends.single.trends.first.query, equals('%23ChainedToTheRhythm'));
      expect(trends.single.trends.first.tweetVolume, equals(48857));
    });
  });
}
