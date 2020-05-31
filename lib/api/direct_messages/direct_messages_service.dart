import 'package:dart_twitter_api/api/twitter_client.dart';
import 'package:meta/meta.dart';

class DirectMessagesService {
  const DirectMessagesService({
    @required this.client,
  });

  final TwitterClient client;
}
