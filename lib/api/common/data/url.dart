import 'package:json_annotation/json_annotation.dart';

part 'url.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Url {
  Url();

  factory Url.fromJson(Map<String, dynamic> json) => _$UrlFromJson(json);

  /// URL pasted/typed into Tweet.
  ///
  /// Example: 'bit.ly/2so49n2'
  String? displayUrl;

  /// Expanded version of [display_url].
  ///
  /// Example: 'http://bit.ly/2so49n2'
  String? expandedUrl;

  /// An array of integers representing offsets within the Tweet text where the
  /// URL begins and ends. The first integer represents the location of the
  /// first character of the URL in the Tweet text. The second integer
  /// represents the location of the first non-URL character after the end of
  /// the URL.
  List<int>? indices;

  /// Wrapped URL, corresponding to the value embedded directly into the raw
  /// Tweet text, and the values for the indices parameter.
  String? url;

  Map<String, dynamic> toJson() => _$UrlToJson(this);
}
