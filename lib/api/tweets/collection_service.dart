import 'package:dart_twitter_api/api/abstract_twitter_client.dart';
import 'package:dart_twitter_api/api/tweets/data/collection/entrie_object_collections.dart';
import 'package:dart_twitter_api/api/tweets/data/collection/collection_object_collections.dart';
import 'package:dart_twitter_api/api/twitter_client.dart';
import 'package:dart_twitter_api/src/utils/map_utils.dart';
import 'package:dart_twitter_api/src/utils/transforms.dart';
import 'package:meta/meta.dart';

class CollectionService {
  const CollectionService({
    @required this.client,
  });

  final AbstractTwitterClient client;

  Future<CollectionObjectCollections> collectionList({
    String userId,
    String screenName,
    String tweetId,
    int count,
    String cursor,
    TransformResponse<CollectionObjectCollections> transform =
        defaultCollectionObjectCollectionsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('user_id', userId)
      ..addParameter('screen_name', screenName)
      ..addParameter('tweet_id', tweetId)
      ..addParameter('count', count)
      ..addParameter('cursor', cursor);

    return client
        .get(Uri.https(
          'api.twitter.com',
          '1.1/collections/list.json',
          params,
        ))
        .then(transform);
  }

  Future<EntrieObjectCollections> entries({
    String id,
    int count,
    int maxPosition,
    int minPosition,
    TransformResponse<EntrieObjectCollections> transform =
        defaultEntrieObjectCollectionsTransform,
  }) async {
    final params = <String, String>{}
      ..addParameter('id', id)
      ..addParameter('count', count)
      ..addParameter('max_position', maxPosition)
      ..addParameter('min_position', minPosition)
      ..addParameter('tweet_mode', 'extended');

    return client
        .get(Uri.https(
          'api.twitter.com',
          '1.1/collections/entries.json',
          params,
        ))
        .then(transform);
  }
}
