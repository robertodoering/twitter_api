import 'package:dart_twitter_api/api/tweets/data/tweet.dart';
import 'package:dart_twitter_api/api/users/data/derived.dart';
import 'package:dart_twitter_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class User {
  User();

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// The string representation of the unique identifier for this User.
  String idStr;

  /// The name of the user, as they’ve defined it. Not necessarily a person’s
  /// name. Typically capped at 50 characters, but subject to change.
  String name;

  /// The screen name, handle, or alias that this user identifies themselves
  /// with. [screen_names] are unique but subject to change. Use [idStr] as a
  /// user identifier whenever possible. Typically a maximum of 15 characters
  /// long, but some historical accounts may exist with longer names.
  String screenName;

  /// Nullable. The user-defined location for this account’s profile. Not
  /// necessarily a location, nor machine-parseable. This field will
  /// occasionally be fuzzily interpreted by the Search service.
  String location;

  /// Enterprise APIs only Collection of Enrichment metadata derived for user.
  /// Provides the Profile Geo Enrichment metadata.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/enrichments/overview/profile-geo.
  Derived derived;

  /// Nullable. A URL provided by the user in association with their profile.
  String url;

  /// Nullable. The user-defined UTF-8 string describing their account.
  String description;

  /// When `true`, indicates that this user has chosen to protect their Tweets.
  ///
  /// See https://help.twitter.com/en/safety-and-security/public-and-protected-tweets.
  bool protected;

  /// When `true`, indicates that the user has a verified account.
  ///
  /// See https://help.twitter.com/en/managing-your-account/about-twitter-verified-accounts.
  bool verified;

  /// Nullable. The user's most recent Tweet.
  ///
  /// You must be following a protected user to be able to see their most recent
  /// Tweet.
  Tweet status;

  /// The number of followers this account currently has. Under certain
  /// conditions of duress, this field will temporarily indicate `0`.
  int followersCount;

  /// The number of users this account is following (AKA their “followings”).
  /// Under certain conditions of duress, this field will temporarily indicate
  /// `0`.
  int friendsCount;

  /// The number of public lists that this user is a member of.
  int listedCount;

  /// The number of Tweets this user has liked in the account’s lifetime.
  int favoritesCount;

  /// The number of Tweets (including retweets) issued by the user.
  int statusesCount;

  /// The UTC datetime that the user account was created on Twitter.
  @JsonKey(fromJson: convertTwitterDateTime)
  DateTime createdAt;

  /// The HTTPS-based URL pointing to the standard web representation of the
  /// user’s uploaded profile banner. By adding a final path element of the URL,
  /// it is possible to obtain different image sizes optimized for specific
  /// displays.
  ///
  /// See https://developer.twitter.com/en/docs/accounts-and-users/user-profile-images-and-banners
  /// for size variants.
  String profileBannerUrl;

  /// A HTTPS-based URL pointing to the user’s profile image.
  String profileImageUrlHttps;

  /// When `true`, indicates that the user has not altered the theme or
  /// background of their user profile.
  bool defaultProfile;

  /// When `true`, indicates that the user has not uploaded their own profile
  /// image and a default image is used instead.
  bool defaultProfileImage;

  /// When present, indicates a list of uppercase two-letter country codes this
  /// content is withheld from. Twitter supports the following non-country
  /// values for this field:
  ///
  /// * `XX` - Content is withheld in all countries
  /// * `XY` - Content is withheld due to a DMCA request.
  List<String> withheldInCountries;

  /// When present, indicates that the content being withheld is a `user`.
  String withheldScope;

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
