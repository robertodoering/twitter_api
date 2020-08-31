import 'package:json_annotation/json_annotation.dart';

part 'entrie_position.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EntriePosition {
  EntriePosition({
    this.maxPosition,
    this.minPosition,
    this.wasTruncated,
  });

  String maxPosition;
  String minPosition;
  bool wasTruncated;

  factory EntriePosition.fromJson(Map<String, dynamic> json) => EntriePosition(
        maxPosition: json['max_position'],
        minPosition: json['min_position'],
        wasTruncated: json['was_truncated'],
      );

  Map<String, dynamic> toJson() => {
        'max_position': maxPosition,
        'min_position': minPosition,
        'was_truncated': wasTruncated,
      };
}
