import 'package:json_annotation/json_annotation.dart';

part 'quoted_status_permalink.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class QuotedStatusPermalink {
  QuotedStatusPermalink();

  factory QuotedStatusPermalink.fromJson(Map<String, dynamic> json) =>
      _$QuotedStatusPermalinkFromJson(json);

  /// Shortened url of the quoted status.
  ///
  /// Example: 'https://t.co/LinkToTweet'
  String? url;

  /// Expanded version of [display].
  ///
  /// Example: 'https://twitter.com/OriginalTweeter/status/994281226797137920'
  String? expanded;

  /// Url of the quoted status.
  /// Example: 'twitter.com/OriginalTweeter/status/994281226797137920'
  String? display;

  Map<String, dynamic> toJson() => _$QuotedStatusPermalinkToJson(this);
}
