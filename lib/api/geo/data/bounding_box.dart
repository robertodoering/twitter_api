import 'package:json_annotation/json_annotation.dart';

part 'bounding_box.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class BoundingBox {
  BoundingBox();

  factory BoundingBox.fromJson(Map<String, dynamic> json) =>
      _$BoundingBoxFromJson(json);

  /// A series of longitude and latitude points, defining a box which will
  /// contain the Place entity this bounding box is related to. Each point is an
  /// array in the form of `[longitude, latitude]`. Points are grouped into an
  /// array per bounding box. Bounding box arrays are wrapped in one additional
  /// array to be compatible with the polygon notation.
  List<List<List<double>>>? coordinates;

  /// The type of data encoded in the coordinates property. This will be
  /// “Polygon” for bounding boxes and “Point” for Tweets with exact
  /// coordinates.
  String? type;

  Map<String, dynamic> toJson() => _$BoundingBoxToJson(this);
}
