// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_banner_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeBannerBean _$HomeBannerBeanFromJson(Map<String, dynamic> json) =>
    HomeBannerBean(
      (json['activities'] as List<dynamic>)
          .map((e) => Activities.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['banners'] as List<dynamic>)
          .map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['color'] as String,
      json['color_system'] as String,
      json['emergency_notice'] as String,
      json['emergencyNotice'] as String,
      GiftCardInfo.fromJson(json['giftCardInfo'] as Map<String, dynamic>),
      json['headlinesMore'] as String,
      json['headlinesAppMore'] as String,
      (json['tabbar'] as List<dynamic>)
          .map((e) => Tabbar.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['safeguards'] as List<dynamic>)
          .map((e) => Safeguards.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeBannerBeanToJson(HomeBannerBean instance) =>
    <String, dynamic>{
      'activities': instance.activities,
      'banners': instance.banners,
      'categories': instance.categories,
      'color': instance.color,
      'color_system': instance.color_system,
      'emergency_notice': instance.emergency_notice,
      'emergencyNotice': instance.emergencyNotice,
      'giftCardInfo': instance.giftCardInfo,
      'headlinesMore': instance.headlinesMore,
      'headlinesAppMore': instance.headlinesAppMore,
      'tabbar': instance.tabbar,
      'safeguards': instance.safeguards,
    };

Activities _$ActivitiesFromJson(Map<String, dynamic> json) => Activities(
      json['activityContent'] as String,
      json['activityImage'] as String,
      json['activityTitle'] as String,
      json['activityUrl'] as String,
      json['flag'] as String,
      json['jumpType'] as String,
      json['jumpValue'] as String,
    );

Map<String, dynamic> _$ActivitiesToJson(Activities instance) =>
    <String, dynamic>{
      'activityContent': instance.activityContent,
      'activityImage': instance.activityImage,
      'activityTitle': instance.activityTitle,
      'activityUrl': instance.activityUrl,
      'flag': instance.flag,
      'jumpType': instance.jumpType,
      'jumpValue': instance.jumpValue,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      json['bannerBgColor'] as String,
      json['bannerContent'] as String,
      json['bannerId'] as String,
      json['bannerImg'] as String,
      json['bannerTitle'] as String,
      json['bannerUrl'] as String,
      json['jumpType'] as String,
      json['jumpPath'] as String,
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'bannerBgColor': instance.bannerBgColor,
      'bannerContent': instance.bannerContent,
      'bannerId': instance.bannerId,
      'bannerImg': instance.bannerImg,
      'bannerTitle': instance.bannerTitle,
      'bannerUrl': instance.bannerUrl,
      'jumpType': instance.jumpType,
      'jumpPath': instance.jumpPath,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      json['category_img'] as String,
      json['category_name'] as String,
      json['menu_id'] as String,
      json['rec_type'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'category_img': instance.category_img,
      'category_name': instance.category_name,
      'menu_id': instance.menu_id,
      'rec_type': instance.rec_type,
      'url': instance.url,
    };

GiftCardInfo _$GiftCardInfoFromJson(Map<String, dynamic> json) => GiftCardInfo(
      json['giftCardActUrl'] as String,
      json['giftCardId'] as String,
      json['giftCardImageList'] as List<dynamic>,
      json['giftCardName'] as String,
      json['giftCardState'] as String,
    );

Map<String, dynamic> _$GiftCardInfoToJson(GiftCardInfo instance) =>
    <String, dynamic>{
      'giftCardActUrl': instance.giftCardActUrl,
      'giftCardId': instance.giftCardId,
      'giftCardImageList': instance.giftCardImageList,
      'giftCardName': instance.giftCardName,
      'giftCardState': instance.giftCardState,
    };

Tabbar _$TabbarFromJson(Map<String, dynamic> json) => Tabbar(
      json['toolbar_title'] as String,
      json['toolbar_icon_temp'] as String,
      json['toolbar_icon'] as String,
      json['toolbar_icon_active'] as String,
    );

Map<String, dynamic> _$TabbarToJson(Tabbar instance) => <String, dynamic>{
      'toolbar_title': instance.toolbar_title,
      'toolbar_icon_temp': instance.toolbar_icon_temp,
      'toolbar_icon': instance.toolbar_icon,
      'toolbar_icon_active': instance.toolbar_icon_active,
    };

Safeguards _$SafeguardsFromJson(Map<String, dynamic> json) => Safeguards(
      json['title'] as String,
      json['icon'] as String,
    );

Map<String, dynamic> _$SafeguardsToJson(Safeguards instance) =>
    <String, dynamic>{
      'title': instance.title,
      'icon': instance.icon,
    };
