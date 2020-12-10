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

    // Update your status (tweet)
    await twitterApi.tweetService.update(
      status: 'Hello world!',
    );
  } catch (error) {
    // Requests made by the client can throw the following errors:
    //
    // * `TimeoutException` when a request hasn't returned a response for some
    //   time (defaults to 10s, can be changed in the TwitterClient).
    //
    // * `Response` when the received response does not have a 2xx status code.
    //   Most responses include additional error information that can be parsed
    //   manually from the response's body.
    //
    // * Other unexpected errors in unlikely events (for example when parsing
    //   the response).
    print('error while requesting home timeline: $error');
  }
}
