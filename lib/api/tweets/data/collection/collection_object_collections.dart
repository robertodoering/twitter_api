import 'package:dart_twitter_api/api/tweets/data/collection/collection_object.dart';
import 'package:dart_twitter_api/api/tweets/data/collection/collection_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_object_collections.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class CollectionObjectCollections {
  CollectionObjectCollections({
    this.objects,
    this.response,
  });

  CollectionObject objects;
  CollectionResponse response;

  factory CollectionObjectCollections.fromJson(Map<String, dynamic> json) =>
      CollectionObjectCollections(
        objects: CollectionObject.fromJson(json['objects']),
        response: CollectionResponse.fromJson(json['response']),
      );

  Map<String, dynamic> toJson() => {
        'objects': objects.toJson(),
        'response': response.toJson(),
      };
}
