import 'package:json_annotation/json_annotation.dart';

import 'size.dart';

part 'sizes.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Sizes {
  Sizes();

  factory Sizes.fromJson(Map<String, dynamic> json) => _$SizesFromJson(json);

  /// Information for a thumbnail-sized version of the media.
  ///
  /// Thumbnail-sized photo media will be limited to fill a 150x150 boundary and
  /// cropped.
  Size? thumb;

  /// Information for a medium-sized version of the media.
  ///
  /// Medium-sized photo media will be limited to fit within a 1200x1200
  /// boundary.
  Size? medium;

  /// Information for a small-sized version of the media.
  ///
  /// Small-sized photo media will be limited to fit within a 680x680 boundary.
  Size? small;

  /// Information for a large-sized version of the media.
  ///
  /// Large-sized photo media will be limited to fit within a 2048x2048
  /// boundary.
  Size? large;

  Map<String, dynamic> toJson() => _$SizesToJson(this);
}
