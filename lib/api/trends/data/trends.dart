import 'package:dart_twitter_api/api/trends/data/trend.dart';
import 'package:dart_twitter_api/api/trends/data/trend_location.dart';
import 'package:dart_twitter_api/src/utils/date_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trends.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Trends {
  Trends();

  factory Trends.fromJson(Map<String, dynamic> json) => _$TrendsFromJson(json);

  List<Trend> trends;

  @JsonKey(fromJson: convertTwitterDateTime)
  DateTime asOf;

  @JsonKey(fromJson: convertTwitterDateTime)
  DateTime createdAt;

  List<TrendLocation> locations;

  Map<String, dynamic> toJson() => _$TrendsToJson(this);
}
