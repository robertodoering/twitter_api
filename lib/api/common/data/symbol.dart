import 'package:json_annotation/json_annotation.dart';

part 'symbol.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Symbol {
  Symbol();

  factory Symbol.fromJson(Map<String, dynamic> json) => _$SymbolFromJson(json);

  /// An array of integers indicating the offsets within the Tweet text where
  /// the symbol/cashtag begins and ends. The first integer represents the
  /// location of the $ character in the Tweet text string. The second integer
  /// represents the location of the first character after the cashtag.
  /// Therefore the difference between the two numbers will be the length of the
  /// hashtag name plus one (for the `$` character).
  List<int>? indices;

  /// Name of the cashhtag, minus the leading `$` character.
  String? text;

  Map<String, dynamic> toJson() => _$SymbolToJson(this);
}
