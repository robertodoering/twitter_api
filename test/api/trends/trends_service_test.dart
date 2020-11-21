import 'dart:io';

import 'package:dart_twitter_api/api/trends/data/trend_location.dart';
import 'package:dart_twitter_api/api/trends/data/trends.dart';
import 'package:dart_twitter_api/api/trends/trends_service.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mock_client.dart';

void main() {
  group('place', () {
    test('parses trends list from response', () async {
      final mockClient = MockClient();

      when(mockClient.get(
        Uri.https('api.twitter.com', '1.1/trends/place.json', {'id': '1'}),
      )).thenAnswer(
        (_) async => Response(
          File('test/api/trends/data/trends_place_response.json')
              .readAsStringSync(),
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
          File('test/api/trends/data/trends_place_response.json')
              .readAsStringSync(),
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

  group('available', () {
    test('parses trend locations from response', () async {
      final mockClient = MockClient();

      when(mockClient.get(
        Uri.https('api.twitter.com', '1.1/trends/available.json'),
      )).thenAnswer(
        (_) async => Response(
          File('test/api/trends/data/trends_available_response.json')
              .readAsStringSync(),
          200,
          headers: {
            'content-type': 'application/json; charset=utf-8',
          },
        ),
      );

      final trendsService = TrendsService(client: mockClient);

      final trendLocations = await trendsService.available();

      expect(trendLocations, isA<List<TrendLocation>>());
      expect(trendLocations.first.country, equals('Sweden'));
      expect(trendLocations.first.countryCode, equals('SE'));
      expect(trendLocations.first.name, equals('Sweden'));
      expect(trendLocations.first.parentid, equals(1));
      expect(
        trendLocations.first.url,
        equals('http://where.yahooapis.com/v1/place/23424954'),
      );
      expect(trendLocations.first.woeid, equals(23424954));
      expect(trendLocations.first.placeType, isA<PlaceType>());
      expect(trendLocations.first.placeType.code, equals(12));
      expect(trendLocations.first.placeType.name, equals('Country'));
    });
  });

  group('closest', () {
    test('parses trend locations from response', () async {
      final mockClient = MockClient();
      when(mockClient.get(
        Uri.https('api.twitter.com', '1.1/trends/closest.json', {
          'lat': '37.7749',
          'long': '122.4194',
        }),
      )).thenAnswer(
        (_) async => Response(
          File('test/api/trends/data/trends_closest_response.json')
              .readAsStringSync(),
          200,
          headers: {
            'content-type': 'application/json; charset=utf-8',
          },
        ),
      );

      final trendsService = TrendsService(client: mockClient);

      final trendLocations = await trendsService.closest(
        lat: '37.7749',
        long: '122.4194',
      );

      expect(trendLocations, isA<List<TrendLocation>>());
      expect(trendLocations.single.country, equals('Australia'));
      expect(trendLocations.single.countryCode, equals('AU'));
      expect(trendLocations.single.name, equals('Australia'));
      expect(trendLocations.single.parentid, equals(1));
      expect(
        trendLocations.single.url,
        equals('http://where.yahooapis.com/v1/place/23424748'),
      );
      expect(trendLocations.single.woeid, equals(23424748));
      expect(trendLocations.single.placeType, isA<PlaceType>());
      expect(trendLocations.single.placeType.code, equals(12));
      expect(trendLocations.single.placeType.name, equals('Country'));
    });
  });
}
