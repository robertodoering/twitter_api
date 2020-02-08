import 'package:json_annotation/json_annotation.dart';
import 'package:twitter_api/api/common/data/hashtag.dart';
import 'package:twitter_api/api/common/data/symbol.dart';
import 'package:twitter_api/api/common/data/user_mention.dart';

part 'entities.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Entities {
  Entities();

  factory Entities.fromJson(Map<String, dynamic> json) =>
      _$EntitiesFromJson(json);

  /// Represents hashtags which have been parsed out of the Tweet text.
  List<Hashtag> hashtags;

  /// Represents media elements uploaded with the Tweet.
  // todo
  // List<Media> media;

  /// Represents URLs included in the text of a Tweet.
  // todo
  // List<Url> urls;

  /// Represents URLs included in the text of a Tweet.
  List<UserMention> userMentions;

  /// Represents symbols, i.e. $cashtags, included in the text of the Tweet.
  List<Symbol> symbols;

  /// Represents Twitter Polls included in the Tweet.
  // todo
  //List<Poll> polls;

  Map<String, dynamic> toJson() => _$EntitiesToJson(this);
}
