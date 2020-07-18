import 'package:dart_twitter_api/api/media/data/additional_media_info.dart';
import 'package:dart_twitter_api/api/media/data/sizes.dart';
import 'package:dart_twitter_api/api/media/data/video_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'media.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Media {
  Media();

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

  /// URL of the media to display to clients.
  String displayUrl;

  /// An expanded version of [displayUrl]. Links to the media display page.
  String expandedUrl;

  /// ID of the media expressed as a string.
  String idStr;

  /// An array of integers indicating the offsets within the Tweet text where
  /// the URL begins and ends. The first integer represents the location of the
  /// first character of the URL in the Tweet text. The second integer
  /// represents the location of the first non-URL character occurring after the
  /// URL (or the end of the string if the URL is the last part of the Tweet
  /// text).
  List<int> indicies;

  /// An `http://` URL pointing directly to the uploaded media file.
  ///
  /// For media in direct messages, [mediaUrl] is the same https URL as
  /// [mediaUrlHttps] and must be accessed by signing a request with the user’s
  /// access token using OAuth 1.0A.
  ///
  /// You cannot directly embed these images in a web page.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/entities-object#photo_format
  /// for how to format a photo's URL, such as [mediaUrlHttps], based on the
  /// available sizes.
  String mediaUrl;

  /// An https:// URL pointing directly to the uploaded media file, for
  /// embedding on https pages.
  ///
  /// For media in direct messages, [mediaUrlHttps] must be accessed by signing
  /// a request with the user’s access token using OAuth 1.0A.
  ///
  /// You cannot directly embed these images in a web page.
  ///
  /// See https://developer.twitter.com/en/docs/tweets/data-dictionary/overview/entities-object#photo_format
  /// for how to format a photo's URL, such as [mediaUrlHttps], based on the
  /// available sizes.
  String mediaUrlHttps;

  /// An object showing available sizes for the media file.
  Sizes sizes;

  /// Nullable. For Tweets containing media that was originally associated with
  /// a different tweet, this string-based ID points to the original Tweet.
  String sourceStatusIdStr;

  /// Type of uploaded media. Possible types include `photo`, `video`, and
  /// `animated_gif`.
  String type;

  /// Wrapped URL for the media link. This corresponds with the URL embedded
  /// directly into the raw Tweet text, and the values for the [indices]
  /// parameter.
  String url;

  /// Contains additional information for the media when the type is `video` or
  /// `animated_gif`.
  VideoInfo videoInfo;

  /// The [additionalMediaInfo] will contain additional media info provided by
  /// the publisher. Video content is made available only to Twitter official
  /// clients when embeddable=false. In this case, all video URLs provided in
  /// the payload will be Twitter-based, so the user can open the video in a
  /// Twitter owned property by clicking the link.
  AdditionalMediaInfo additionalMediaInfo;

  Map<String, dynamic> toJson() => _$MediaToJson(this);
}
