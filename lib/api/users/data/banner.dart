import 'package:json_annotation/json_annotation.dart';

part 'banner.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Banner {
  Banner();

  factory Banner.fromJson(Map<String, dynamic> json) => _$BannerFromJson(json);

  BannerSizes? sizes;

  Map<String, dynamic> toJson() => _$BannerToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class BannerSizes {
  BannerSizes();

  factory BannerSizes.fromJson(Map<String, dynamic> json) =>
      _$BannerSizesFromJson(json);

  BannerSize? ipad;
  BannerSize? ipadRetina;
  BannerSize? web;
  BannerSize? webRetina;
  BannerSize? mobile;
  BannerSize? mobileRetina;

  @JsonKey(name: '300x100')
  BannerSize? size300x100;

  @JsonKey(name: '600x200')
  BannerSize? size600x200;

  @JsonKey(name: '1500x500')
  BannerSize? size1500x500;

  Map<String, dynamic> toJson() => _$BannerSizesToJson(this);
}

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class BannerSize {
  BannerSize();

  factory BannerSize.fromJson(Map<String, dynamic> json) =>
      _$BannerSizeFromJson(json);

  int? h;
  int? w;
  String? url;

  Map<String, dynamic> toJson() => _$BannerSizeToJson(this);
}
