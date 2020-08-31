import 'package:dart_twitter_api/api/tweets/data/collection/collection_cursor.dart';
import 'package:dart_twitter_api/api/tweets/data/collection/collection_result.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_response.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CollectionResponse {
  CollectionResponse({
    this.results,
    this.cursors,
  });

  List<CollectionResult> results;
  CollectionCursors cursors;

  factory CollectionResponse.fromJson(Map<String, dynamic> json) =>
      CollectionResponse(
        results: List<CollectionResult>.from(
            json['results'].map((x) => CollectionResult.fromJson(x))),
        cursors: CollectionCursors.fromJson(json['cursors']),
      );

  Map<String, dynamic> toJson() => {
        'results': List<dynamic>.from(results.map((x) => x.toJson())),
        'cursors': cursors.toJson(),
      };
}
