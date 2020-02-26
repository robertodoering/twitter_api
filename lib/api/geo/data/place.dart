import 'package:json_annotation/json_annotation.dart';
import 'package:twitter_api/api/geo/data/bounding_box.dart';

part 'place.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Place {
  Place();

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

  /// ID representing this place. Note that this is represented as a string, not
  /// an integer.
  String id;

  /// URL representing the location of additional place metadata for this place.
  String url;

  /// The type of location represented by this place.
  ///
  /// Example: 'city'.
  String placeType;

  /// Short human-readable representation of the place’s name.
  ///
  /// Example: 'Manhattan'.
  String name;

  /// Full human-readable representation of the place’s name.
  String fullName;

  /// Shortened country code representing the country containing this place.
  String countryCode;

  /// Name of the country containing this place.
  String country;

  /// A bounding box of coordinates which encloses this place.
  BoundingBox boundingBox;

  Map<String, dynamic> toJson() => _$PlaceToJson(this);
}
