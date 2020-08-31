import 'package:json_annotation/json_annotation.dart';

part 'entrie_timeline_tweet.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EntrieTimelineTweet {
  EntrieTimelineTweet({
    this.id,
    this.sortIndex,
  });

  String id;
  String sortIndex;

  factory EntrieTimelineTweet.fromJson(Map<String, dynamic> json) =>
      EntrieTimelineTweet(
        id: json['id'],
        sortIndex: json['sort_index'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'sort_index': sortIndex,
      };
}
