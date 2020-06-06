import 'package:dart_twitter_api/twitter_api.dart';

final twitterApi = TwitterApi(
  client: TwitterClient(
    consumerKey: 'your_consumer_key',
    consumerSecret: 'your_consumer_secret',
    token: 'your_token',
    secret: 'your_secret',
  ),
);

Future<void> main() async {
  try {
    // Get the last 200 tweets from your home timeline
    final homeTimeline = await twitterApi.timelineService.homeTimeline(
      count: 200,
    );

    // Print the text of each Tweet
    homeTimeline.forEach((tweet) => print(tweet.fullText));
  } catch (error) {
    // If no response is received or if the response status code does not start
    // with 2, an exception is thrown
    print('error while requesting home timeline: $error');
  }
}
