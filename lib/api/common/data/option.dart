import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Option {
  Option();

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  /// The poll position for this option.
  int position;

  /// The text of this poll option.
  String text;

  Map<String, dynamic> toJson() => _$OptionToJson(this);
}
