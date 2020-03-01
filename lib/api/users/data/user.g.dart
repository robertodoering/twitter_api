// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..idStr = json['id_str'] as String
    ..name = json['name'] as String
    ..screenName = json['screen_name'] as String
    ..location = json['location'] as String
    ..derived = json['derived'] == null
        ? null
        : Derived.fromJson(json['derived'] as Map<String, dynamic>)
    ..url = json['url'] as String
    ..description = json['description'] as String
    ..protected = json['protected'] as bool
    ..verified = json['verified'] as bool
    ..followersCount = json['followers_count'] as int
    ..friendsCount = json['friends_count'] as int
    ..listedCount = json['listed_count'] as int
    ..favoritesCount = json['favourites_count'] as int
    ..statusesCount = json['statuses_count'] as int
    ..createdAt = convertTwitterDateTime(json['created_at'] as String)
    ..profileBannerUrl = json['profile_banner_url'] as String
    ..profileImageUrlHttps = json['profile_image_url_https'] as String
    ..defaultProfile = json['default_profile'] as bool
    ..defaultProfileImage = json['default_profile_image'] as bool
    ..withheldInCountries = (json['withheld_in_countries'] as List)
        ?.map((e) => e as String)
        ?.toList()
    ..withheldScope = json['withheld_scope'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id_str': instance.idStr,
      'name': instance.name,
      'screen_name': instance.screenName,
      'location': instance.location,
      'derived': instance.derived?.toJson(),
      'url': instance.url,
      'description': instance.description,
      'protected': instance.protected,
      'verified': instance.verified,
      'followers_count': instance.followersCount,
      'friends_count': instance.friendsCount,
      'listed_count': instance.listedCount,
      'favourites_count': instance.favoritesCount,
      'statuses_count': instance.statusesCount,
      'created_at': instance.createdAt?.toIso8601String(),
      'profile_banner_url': instance.profileBannerUrl,
      'profile_image_url_https': instance.profileImageUrlHttps,
      'default_profile': instance.defaultProfile,
      'default_profile_image': instance.defaultProfileImage,
      'withheld_in_countries': instance.withheldInCountries,
      'withheld_scope': instance.withheldScope,
    };
