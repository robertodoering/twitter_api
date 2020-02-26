import 'package:json_annotation/json_annotation.dart';

part 'coordinates.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Coordinates {
  Coordinates();

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);

  /// The longitude and latitude of the Tweet’s location, as a collection in the
  /// form `[longitude, latitude]`.
  List<double> coordinates;

  /// The type of data encoded in the coordinates property. This will be “Point”
  /// for Tweet coordinates fields.
  String type;

  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}
