import 'package:dart_twitter_api/api/common/data/entities.dart';
import 'package:dart_twitter_api/api/geo/data/coordinates.dart';
import 'package:dart_twitter_api/api/geo/data/place.dart';
import 'package:dart_twitter_api/api/tweets/data/current_user_retweet.dart';
import 'package:dart_twitter_api/api/tweets/data/quoted_status_permalink.dart';
import 'package:dart_twitter_api/api/users/data/user.dart';
import 'package:dart_twitter_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Tweet {
  Tweet();

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  /// UTC time when this Tweet was created.
  @JsonKey(fromJson: convertTwitterDateTime)
  DateTime? createdAt;

  /// The string representation of the unique identifier for this Tweet.
  String? idStr;

  /// The actual UTF-8 text of the status update.
  ///
  /// [text] is not included when receiving extended Tweet objects (when adding
  /// `tweet_mode=extended` as a parameter to any endpoint).
  /// Instead [fullText] is received.
  String? text;

  /// Utility used to post the Tweet, as an HTML-formatted string. Tweets from
  /// the Twitter website have a source value of web.
  String? source;

  /// Indicates whether the value of the text parameter was truncated, for
  /// example, as a result of a retweet exceeding the original Tweet text length
  /// limit of 140 characters. Truncated text will end in ellipsis, like this
  /// `...`. Since Twitter now rejects long Tweets vs truncating them, the large
  /// majority of Tweets will have this set to `false`. Note that while native
  /// retweets may have their toplevel text property shortened, the original
  /// text will be available under the [retweetedStatus] object and the
  /// truncated parameter will be set to the value of the original status (in
  /// most cases, `false`).
  ///
  /// [truncated] will always be `false` when receiving extended Tweet objects.
  bool? truncated;

  /// Nullable. If the represented Tweet is a reply, this field will contain the
  /// string representation of the original Tweet’s ID.
  String? inReplyToStatusIdStr;

  /// Nullable. If the represented Tweet is a reply, this field will contain the
  /// integer representation of the original Tweet’s author ID. This will not
  /// necessarily always be the user directly mentioned in the Tweet.
  String? inReplyToUserIdStr;

  /// Nullable. If the represented Tweet is a reply, this field will contain the
  /// screen name of the original Tweet’s author.
  String? inReplyToScreenName;

  /// The user who posted this Tweet.
  User? user;

  /// Nullable. Represents the geographic location of this Tweet as reported by
  /// the user or client application.
  Coordinates? coordinates;

  /// Nullable. When present, indicates that the tweet is associated (but not
  /// necessarily originating from) a Place.
  Place? place;

  /// This field only surfaces when the Tweet is a quote Tweet. This is the
  /// string representation Tweet ID of the quoted Tweet.
  String? quotedStatusIdStr;

  /// Indicates whether this is a Quoted Tweet.
  bool? isQuoteStatus;

  /// This field only surfaces when the Tweet is a quote Tweet. This attribute
  /// contains the Tweet object of the original Tweet that was quoted.
  Tweet? quotedStatus;

  /// Users can amplify the broadcast of Tweets authored by other users by
  /// `retweeting`. Retweets can be distinguished from typical Tweets by the
  /// existence of a [retweetedStatus] attribute. This attribute contains a
  /// representation of the original Tweet that was retweeted. Note that
  /// retweets of retweets do not show representations of the intermediary
  /// retweet, but only the original Tweet. (Users can also unretweet a retweet
  /// they created by deleting their retweet.)
  Tweet? retweetedStatus;

  /// Nullable. Indicates approximately how many times this Tweet has been
  /// quoted by Twitter users.
  ///
  /// Note: This object is only available with the Premium and Enterprise tier
  /// products.
  int? quoteCount;

  /// Number of times this Tweet has been replied to.
  ///
  /// Note: This object is only available with the Premium and Enterprise tier
  /// products.
  int? replyCount;

  /// Number of times this Tweet has been retweeted.
  int? retweetCount;

  /// Nullable. Indicates approximately how many times this Tweet has been liked
  /// by Twitter users.
  int? favoriteCount;

  /// Entities which have been parsed out of the text of the Tweet.
  Entities? entities;

  /// When between one and four native photos or one video or one animated GIF
  /// are in Tweet, contains an array 'media' metadata. This is also available
  /// in Quote Tweets.
  Entities? extendedEntities;

  /// Nullable. Indicates whether this Tweet has been liked by the
  /// authenticating user.
  bool? favorited;

  /// Indicates whether this Tweet has been Retweeted by the authenticating
  /// user.
  bool? retweeted;

  /// Nullable. This field only surfaces when a Tweet contains a link. The
  /// meaning of the field doesn’t pertain to the Tweet content itself, but
  /// instead it is an indicator that the URL contained in the Tweet may contain
  /// content or media identified as sensitive content.
  bool? possiblySensitive;

  bool? possiblySensitiveAppealable;

  /// Nullable. This field only surfaces when a Tweet contains a
  /// current_user_retweet. The meaning of the field doesn’t pertain to the
  /// Tweet content itself, but instead it is an indicator that the current
  /// authenticated user reweeted the Tweet. This can be included if
  /// the [includeMyRetweet] param in any [service] method is set to true.
  CurrentUserRetweet? currentUserRetweet;

  /// Nullable. When present, indicates a BCP 47 language identifier
  /// corresponding to the machine-detected language of the Tweet text, or `und`
  /// if no language could be detected.
  String? lang;

  /// URL metadata for the quoted Tweet.
  QuotedStatusPermalink? quotedStatusPermalink;

  // Extended mode fields:

  /// The actual UTF-8 text of the status update.
  ///
  /// [fullText] is only included when receiving extended Tweet objects (when
  /// adding `tweet_mode=extended` as a parameter to any endoint).
  ///
  /// [fullText] is never truncated.
  String? fullText;

  /// An array of two unicode code point indices, identifying the inclusive
  /// start and exclusive end of the displayable content of the tweet.
  List<int>? displayTextRange;

  Map<String, dynamic> toJson() => _$TweetToJson(this);
}
