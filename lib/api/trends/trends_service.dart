import 'package:dart_twitter_api/src/utils/map_utils.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:meta/meta.dart';

class TrendsService {
  const TrendsService({
    @required this.client,
  });

  final AbstractTwitterClient client;

  /// Returns the top 50 trending topics for a specific `WOEID`, if trending
  /// information is available for it.
  ///
  /// [id]: The Yahoo! Where On Earth ID of the location to return trending
  /// information for. Global information is available by using 1 as the
  /// `WOEID`.
  ///
  /// [exclude]: Setting this equal to `hashtags` will remove all hashtags from
  /// the trends list.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/trends/trends-for-location/api-reference/get-trends-place.
  Future<List<Trends>> place({
    @required int id,
    String exclude,
    TransformResponse<List<Trends>> transform = defaultTrendsListTransform,
  }) {
    final params = <String, String>{}
      ..addParameter('id', id)
      ..addParameter('exclude', exclude);

    return client
        .get(
          Uri.https('api.twitter.com', '1.1/trends/place.json', params),
        )
        .then(transform);
  }

  /// Returns the locations that Twitter has trending topic information for.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-available.
  Future<List<TrendLocation>> available({
    TransformResponse<List<TrendLocation>> transform =
        defaultTrendLocationsTransform,
  }) {
    return client
        .get(
          Uri.https('api.twitter.com', '1.1/trends/available.json'),
        )
        .then(transform);
  }

  /// Returns the locations that Twitter has trending topic information for,
  /// closest to a specified location.
  ///
  /// [lat]: If provided with a long parameter the available trend locations
  /// will be sorted by distance, nearest to furthest, to the co-ordinate pair.
  /// The valid ranges for longitude is -180.0 to +180.0 (West is negative, East
  /// is positive) inclusive.
  ///
  /// [long]: If provided with a lat parameter the available trend locations
  /// will be sorted by distance, nearest to furthest, to the co-ordinate pair.
  /// The valid ranges for longitude is -180.0 to +180.0 (West is negative, East
  /// is positive) inclusive.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/twitter-api/v1/trends/locations-with-trending-topics/api-reference/get-trends-closest.
  Future<List<TrendLocation>> closest({
    @required String lat,
    @required String long,
    TransformResponse<List<TrendLocation>> transform =
        defaultTrendLocationsTransform,
  }) {
    final params = <String, String>{}
      ..addParameter('lat', lat)
      ..addParameter('long', long);

    return client
        .get(
          Uri.https('api.twitter.com', '/1.1/trends/closest.json', params),
        )
        .then(transform);
  }
}
