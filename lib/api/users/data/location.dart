import 'package:json_annotation/json_annotation.dart';
import 'package:twitter_api/api/geo/data/coordinates.dart';

part 'location.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Location {
  Location();

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);

  /// The country location for where the user that created the Tweet is from.
  String country;

  /// A two-letter ISO-3166 country code that corresponds to the country
  /// location for where the user that created the Tweet is from.
  String countryCode;

  /// The locality location (generally city) for where the user that created the
  /// Tweet is from.
  String locality;

  /// The region location (generally state/province) for where the user that
  /// created the Tweet is from.
  String region;

  /// The sub-region location (generally county) for where the user that created
  /// the Tweet is from.
  String subRegion;

  /// The full name (excluding sub-region) for where the user that created the
  /// Tweet is from.
  String fullName;

  /// An array that includes a lat/long value for a coordinate that corresponds
  /// to the lowers granularity location for where the user that created the
  /// Tweet is from.
  Coordinates geo;

  Map<String, dynamic> toJson() => _$LocationToJson(this);
}
