// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Banner _$BannerFromJson(Map<String, dynamic> json) {
  return Banner()
    ..sizes = json['sizes'] == null
        ? null
        : BannerSizes.fromJson(json['sizes'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BannerToJson(Banner instance) => <String, dynamic>{
      'sizes': instance.sizes?.toJson(),
    };

BannerSizes _$BannerSizesFromJson(Map<String, dynamic> json) {
  return BannerSizes()
    ..ipad = json['ipad'] == null
        ? null
        : BannerSize.fromJson(json['ipad'] as Map<String, dynamic>)
    ..ipadRetina = json['ipad_retina'] == null
        ? null
        : BannerSize.fromJson(json['ipad_retina'] as Map<String, dynamic>)
    ..web = json['web'] == null
        ? null
        : BannerSize.fromJson(json['web'] as Map<String, dynamic>)
    ..webRetina = json['web_retina'] == null
        ? null
        : BannerSize.fromJson(json['web_retina'] as Map<String, dynamic>)
    ..mobile = json['mobile'] == null
        ? null
        : BannerSize.fromJson(json['mobile'] as Map<String, dynamic>)
    ..mobileRetina = json['mobile_retina'] == null
        ? null
        : BannerSize.fromJson(json['mobile_retina'] as Map<String, dynamic>)
    ..size300x100 = json['300x100'] == null
        ? null
        : BannerSize.fromJson(json['300x100'] as Map<String, dynamic>)
    ..size600x200 = json['600x200'] == null
        ? null
        : BannerSize.fromJson(json['600x200'] as Map<String, dynamic>)
    ..size1500x500 = json['1500x500'] == null
        ? null
        : BannerSize.fromJson(json['1500x500'] as Map<String, dynamic>);
}

Map<String, dynamic> _$BannerSizesToJson(BannerSizes instance) =>
    <String, dynamic>{
      'ipad': instance.ipad?.toJson(),
      'ipad_retina': instance.ipadRetina?.toJson(),
      'web': instance.web?.toJson(),
      'web_retina': instance.webRetina?.toJson(),
      'mobile': instance.mobile?.toJson(),
      'mobile_retina': instance.mobileRetina?.toJson(),
      '300x100': instance.size300x100?.toJson(),
      '600x200': instance.size600x200?.toJson(),
      '1500x500': instance.size1500x500?.toJson(),
    };

BannerSize _$BannerSizeFromJson(Map<String, dynamic> json) {
  return BannerSize()
    ..h = json['h'] as int?
    ..w = json['w'] as int?
    ..url = json['url'] as String?;
}

Map<String, dynamic> _$BannerSizeToJson(BannerSize instance) =>
    <String, dynamic>{
      'h': instance.h,
      'w': instance.w,
      'url': instance.url,
    };
