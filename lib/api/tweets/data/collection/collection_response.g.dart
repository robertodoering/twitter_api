// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionResponse _$CollectionResponseFromJson(Map<String, dynamic> json) {
  return CollectionResponse(
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : CollectionResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    cursors: json['cursors'] == null
        ? null
        : CollectionCursors.fromJson(json['cursors'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CollectionResponseToJson(CollectionResponse instance) =>
    <String, dynamic>{
      'results': instance.results?.map((e) => e?.toJson())?.toList(),
      'cursors': instance.cursors?.toJson(),
    };
