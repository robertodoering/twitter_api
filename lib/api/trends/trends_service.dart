import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
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
}
