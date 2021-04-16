import 'dart:io';

import 'package:dart_twitter_api/api/lists/data/twitter_list.dart';
import 'package:dart_twitter_api/api/lists/lists_service.dart';
import 'package:dart_twitter_api/twitter_api.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../mocks/mock_twitter_client.mocks.dart';

void main() {
  test('`list` parses twitter lists from response', () async {
    final mockClient = MockTwitterClient();

    when(mockClient.get(
      Uri.https('api.twitter.com', '1.1/lists/list.json', {'user_id': '1'}),
    )).thenAnswer(
      (_) async => Response(
        File('test/api/lists/data/list.json').readAsStringSync(),
        200,
        headers: {'content-type': 'application/json; charset=utf-8'},
      ),
    );

    final listsService = ListsService(client: mockClient);

    final lists = await listsService.list(userId: '1');

    expect(lists, isA<List<TwitterList>>());
    expect(lists.first.slug, equals('meetup-20100301'));
    expect(lists.first.name, equals('meetup-20100301'));
    expect(lists.first.createdAt, isA<DateTime>());
    expect(lists.first.uri, equals('/twitterapi/meetup-20100301'));
    expect(lists.first.subscriberCount, equals(147));
    expect(lists.first.idStr, equals('8044403'));
    expect(lists.first.memberCount, equals(116));
    expect(lists.first.mode, equals('public'));
    expect(lists.first.fullName, equals('@twitterapi/meetup-20100301'));
    expect(
      lists.first.description,
      equals('Guests attending the Twitter meetup on 1 March 2010 at the '
          '@twoffice'),
    );
    expect(lists.first.user, isA<User>());
    expect(lists.first.following, isFalse);
  });
}
