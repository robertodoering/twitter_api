import 'package:json_annotation/json_annotation.dart';

part 'trend_location.g.dart';

/// The `trends/place` response only contains [name] and [woeid] in its
/// [TrendLocation]s.
///
/// For whatever reason the response keys are not in snake_case, and the id in
/// parentid is not capitalized.
@JsonSerializable(
  explicitToJson: true,
)
class TrendLocation {
  TrendLocation();

  factory TrendLocation.fromJson(Map<String, dynamic> json) =>
      _$TrendLocationFromJson(json);

  String name;
  int woeid;

  String country;
  String countryCode;
  int parentid;
  String url;
  PlaceType placeType;

  Map<String, dynamic> toJson() => _$TrendLocationToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class PlaceType {
  PlaceType();

  factory PlaceType.fromJson(Map<String, dynamic> json) =>
      _$PlaceTypeFromJson(json);

  int code;
  String name;

  Map<String, dynamic> toJson() => _$PlaceTypeToJson(this);
}
