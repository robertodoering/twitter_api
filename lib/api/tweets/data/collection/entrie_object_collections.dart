import 'package:dart_twitter_api/api/tweets/data/collection/entrie_object.dart';
import 'package:dart_twitter_api/api/tweets/data/collection/entrie_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'entrie_object_collections.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class EntrieObjectCollections {
  EntrieObjectCollections({
    this.objects,
    this.response,
  });

  EntrieObject objects;
  EntrieResponse response;

  factory EntrieObjectCollections.fromJson(Map<String, dynamic> json) =>
      EntrieObjectCollections(
        objects: EntrieObject.fromJson(json['objects']),
        response: EntrieResponse.fromJson(json['response']),
      );

  Map<String, dynamic> toJson() => {
        'objects': objects.toJson(),
        'response': response.toJson(),
      };
}
