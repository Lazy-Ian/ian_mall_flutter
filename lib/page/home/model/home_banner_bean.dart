import 'package:json_annotation/json_annotation.dart';

/// Created by Ian on 2024/1/24
/// Email: yixin0212@qq.com
/// Function :

part 'home_banner_bean.g.dart';

@JsonSerializable()
class HomeBannerBean extends Object {
  List<Activities> activities;

  List<Banners> banners = [];

  List<Categories> categories;

  String color;

  String color_system;

  String emergency_notice;

  String emergencyNotice;

  GiftCardInfo giftCardInfo;

  String headlinesMore;

  String headlinesAppMore;

  List<Tabbar> tabbar;

  List<Safeguards> safeguards;

  HomeBannerBean(
    this.activities,
    this.banners,
    this.categories,
    this.color,
    this.color_system,
    this.emergency_notice,
    this.emergencyNotice,
    this.giftCardInfo,
    this.headlinesMore,
    this.headlinesAppMore,
    this.tabbar,
    this.safeguards,
  );

  factory HomeBannerBean.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeBannerBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeBannerBeanToJson(this);
}

@JsonSerializable()
class Activities extends Object {
  String activityContent;

  String activityImage;

  String activityTitle;

  String activityUrl;

  String flag;

  String jumpType;

  String jumpValue;

  Activities(
    this.activityContent,
    this.activityImage,
    this.activityTitle,
    this.activityUrl,
    this.flag,
    this.jumpType,
    this.jumpValue,
  );

  factory Activities.fromJson(Map<String, dynamic> srcJson) =>
      _$ActivitiesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivitiesToJson(this);
}

@JsonSerializable()
class Banners extends Object {
  String bannerBgColor;

  String bannerContent;

  String bannerId;

  String bannerImg;

  String bannerTitle;

  String bannerUrl;

  String jumpType;

  String jumpPath;

  Banners(
    this.bannerBgColor,
    this.bannerContent,
    this.bannerId,
    this.bannerImg,
    this.bannerTitle,
    this.bannerUrl,
    this.jumpType,
    this.jumpPath,
  );

  factory Banners.fromJson(Map<String, dynamic> srcJson) =>
      _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);
}

@JsonSerializable()
class Categories extends Object {
  String category_img;

  String category_name;

  String menu_id;

  String rec_type;

  String url;

  Categories(
    this.category_img,
    this.category_name,
    this.menu_id,
    this.rec_type,
    this.url,
  );

  factory Categories.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}

@JsonSerializable()
class GiftCardInfo extends Object {
  String giftCardActUrl;

  String giftCardId;

  List<dynamic> giftCardImageList;

  String giftCardName;

  String giftCardState;

  GiftCardInfo(
    this.giftCardActUrl,
    this.giftCardId,
    this.giftCardImageList,
    this.giftCardName,
    this.giftCardState,
  );

  factory GiftCardInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$GiftCardInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$GiftCardInfoToJson(this);
}

@JsonSerializable()
class Tabbar extends Object {
  String toolbar_title;

  String toolbar_icon_temp;

  String toolbar_icon;

  String toolbar_icon_active;

  Tabbar(
    this.toolbar_title,
    this.toolbar_icon_temp,
    this.toolbar_icon,
    this.toolbar_icon_active,
  );

  factory Tabbar.fromJson(Map<String, dynamic> srcJson) =>
      _$TabbarFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TabbarToJson(this);
}

@JsonSerializable()
class Safeguards extends Object {
  String title;

  String icon;

  Safeguards(
    this.title,
    this.icon,
  );

  factory Safeguards.fromJson(Map<String, dynamic> srcJson) =>
      _$SafeguardsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SafeguardsToJson(this);
}
