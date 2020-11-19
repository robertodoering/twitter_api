import 'package:json_annotation/json_annotation.dart';

part 'trend.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Trend {
  Trend();

  factory Trend.fromJson(Map<String, dynamic> json) => _$TrendFromJson(json);

  String name;
  String url;
  dynamic promotedContent;
  String query;
  int tweetVolume;

  Map<String, dynamic> toJson() => _$TrendToJson(this);
}
