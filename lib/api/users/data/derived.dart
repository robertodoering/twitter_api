import 'package:dart_twitter_api/api/users/data/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'derived.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Derived {
  Derived();

  factory Derived.fromJson(Map<String, dynamic> json) =>
      _$DerivedFromJson(json);

  List<Location> locations;

  Map<String, dynamic> toJson() => _$DerivedToJson(this);
}
