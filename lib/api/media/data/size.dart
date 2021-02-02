import 'package:json_annotation/json_annotation.dart';

part 'size.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Size {
  Size();

  factory Size.fromJson(Map<String, dynamic> json) => _$SizeFromJson(json);

  /// Width in pixels of this size.
  int? w;

  /// Height in pixels of this size.
  int? h;

  /// Resizing method used to obtain this size. A value of `fit` means that the
  /// media was resized to fit one dimension, keeping its native aspect ratio. A
  /// value of `crop` means that the media was cropped in order to fit a
  /// specific resolution.
  String? resize;

  Map<String, dynamic> toJson() => _$SizeToJson(this);
}
