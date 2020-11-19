import 'package:json_annotation/json_annotation.dart';

part 'trend_location.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class TrendLocation {
  TrendLocation();

  factory TrendLocation.fromJson(Map<String, dynamic> json) =>
      _$TrendLocationFromJson(json);

  String name;
  int woeid;

  Map<String, dynamic> toJson() => _$TrendLocationToJson(this);
}
