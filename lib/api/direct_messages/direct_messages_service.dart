import 'package:meta/meta.dart';
import 'package:twitter_api/api/twitter_client.dart';

class DirectMessagesService {
  const DirectMessagesService({
    @required this.client,
  });

  final TwitterClient client;
}
