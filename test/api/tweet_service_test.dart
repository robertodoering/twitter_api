import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:twitter_api/api/tweets/tweet_service.dart';

import 'mock_client.dart';

void main() async {
  test('update returns tweet object from response', () {
    final mockClient = MockClient();

    when(mockClient.post(
      Uri.https('api.twitter.com', '1.1/statuses/update.json'),
      body: anyNamed('body'),
    )).thenAnswer(() async {});

    final tweetService = TweetService(client: mockClient);
  });
}
