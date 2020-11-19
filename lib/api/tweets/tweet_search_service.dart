import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:dart_twitter_api/api/tweets/data/tweet_search.dart';
import 'package:dart_twitter_api/api/twitter_client.dart';
import 'package:dart_twitter_api/src/utils/map_utils.dart';
import 'package:dart_twitter_api/src/utils/transforms.dart';
import 'package:meta/meta.dart';

class TweetSearchService {
  const TweetSearchService({
    @required this.client,
  });

  final AbstractTwitterClient client;

  /// Returns a collection of relevant Tweets matching a specified query.
  ///
  /// Please note that Twitter's search service and, by extension, the Search
  /// API is not meant to be an exhaustive source of Tweets. Not all Tweets will
  /// be indexed or made available via the search interface.
  ///
  /// To learn how to use Twitter Search effectively, please see
  /// https://developer.twitter.com/en/docs/tweets/search/guides/standard-operators
  /// for a list of available filter operators. Also, see
  /// https://developer.twitter.com/en/docs/tweets/timelines/guides/working-with-timelines
  /// to learn best practices for navigating results by [sinceId] and [maxId].
  ///
  /// [q]: A UTF-8, URL-encoded search query of 500 characters maximum,
  /// including operators. Queries may additionally be limited by complexity.
  ///
  /// [geocode]: Returns tweets by users located within a given radius of the
  /// given latitude/longitude. The location is preferentially taking from the
  /// Geotagging API, but will fall back to their Twitter profile. The parameter
  /// value is specified by `latitude,longitude,radius`, where radius units must
  /// be specified as either `mi` (miles) or `km` (kilometers). Note that you
  /// cannot use the near operator via the API to geocode arbitrary locations;
  /// however you can use this geocode parameter to search near geocodes
  /// directly. A maximum of 1,000 distinct "sub-regions" will be considered
  /// when using the radius modifier.
  ///
  /// [lang]: Restricts tweets to the given language, given by an ISO 639-1
  /// code. Language detection is best-effort.
  ///
  /// [locale]: Specify the language of the query you are sending (only `ja` is
  /// currently effective). This is intended for language-specific consumers and
  /// the default should work in the majority of cases.
  ///
  /// [resultType]: Optional. Specifies what type of search results you would
  /// prefer to receive. The current default is `mixed`. Valid values include:
  ///
  /// * mixed: Include both popular and real time results in the response.
  /// * recent: return only the most recent results in the response
  /// * popular: return only the most popular results in the response.
  ///
  /// [count]: The number of tweets to return per page, up to a maximum of 100.
  /// Defaults to 15.
  ///
  /// [until]: Returns tweets created before the given date. Date should be
  /// formatted as `YYYY-MM-DD`. Keep in mind that the search index has a 7-day
  /// limit. In other words, no tweets will be found for a date older than one
  /// week.
  ///
  /// [sinceId]: Returns results with an ID greater than (that is, more recent
  /// than) the specified ID. There are limits to the number of Tweets which can
  /// be accessed through the API. If the limit of Tweets has occured since the
  /// [sinceId], the [sinceId] will be forced to the oldest ID available.
  ///
  /// [maxId]: Returns results with an ID less than (that is, older than) or
  /// equal to the specified ID.
  ///
  /// [includeEntities]: The entities node will not be included when set to
  /// `false`.
  ///
  /// [tweetMode]: When set to `extended`, uses the extended Tweets.
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/intro-to-tweet-json#extendedtweet.
  ///
  /// [transform]: Can be used to parse the request. By default, the response is
  /// parsed in an isolate.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/search/api-reference/get-search-tweets.
  Future<TweetSearch> searchTweets({
    @required String q,
    List<double> geocode,
    String lang,
    String locale,
    String resultType,
    int count,
    String until,
    String sinceId,
    String maxId,
    bool includeEntities,
    String tweetMode = 'extended',
    TransformResponse<TweetSearch> transform = defaultTweetSearchTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('q', q)
      ..addParameter('geocode', geocode)
      ..addParameter('lang', lang)
      ..addParameter('locale', locale)
      ..addParameter('result_type', resultType)
      ..addParameter('count', count)
      ..addParameter('until', until)
      ..addParameter('since_id', sinceId)
      ..addParameter('max_id', maxId)
      ..addParameter('include_entities', includeEntities)
      ..addParameter('tweet_mode', tweetMode);

    return client
        .get(Uri.https('api.twitter.com', '1.1/search/tweets.json', params))
        .then(transform);
  }
}
