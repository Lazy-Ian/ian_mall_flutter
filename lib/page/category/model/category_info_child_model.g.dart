// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_info_child_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryInfoChildModel _$CategoryInfoChildModelFromJson(
        Map<String, dynamic> json) =>
    CategoryInfoChildModel(
      ActivityBannerModel.fromJson(
          json['activity_banner'] as Map<String, dynamic>),
      BrandListModel.fromJson(json['brand_list'] as Map<String, dynamic>),
      (json['cate_list'] as List<dynamic>)
          .map((e) => CateListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      SpecialListModel.fromJson(json['special_list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryInfoChildModelToJson(
        CategoryInfoChildModel instance) =>
    <String, dynamic>{
      'activity_banner': instance.activity_banner,
      'brand_list': instance.brand_list,
      'cate_list': instance.cate_list,
      'special_list': instance.special_list,
    };

ActivityBannerModel _$ActivityBannerModelFromJson(Map<String, dynamic> json) =>
    ActivityBannerModel(
      json['activity_img'] as String,
      json['activity_title'] as String,
      json['activity_url'] as String,
    );

Map<String, dynamic> _$ActivityBannerModelToJson(
        ActivityBannerModel instance) =>
    <String, dynamic>{
      'activity_img': instance.activity_img,
      'activity_title': instance.activity_title,
      'activity_url': instance.activity_url,
    };

BrandListModel _$BrandListModelFromJson(Map<String, dynamic> json) =>
    BrandListModel(
      (json['child_list'] as List<dynamic>)
          .map((e) =>
              BrandListChildListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['parent_name'] as String,
    );

Map<String, dynamic> _$BrandListModelToJson(BrandListModel instance) =>
    <String, dynamic>{
      'child_list': instance.child_list,
      'parent_name': instance.parent_name,
    };

BrandListChildListModel _$BrandListChildListModelFromJson(
        Map<String, dynamic> json) =>
    BrandListChildListModel(
      json['brand_desc'] as String,
      json['brand_id'] as String,
      json['brand_img'] as String,
      json['brand_name'] as String,
      json['menu_id'] as String,
    );

Map<String, dynamic> _$BrandListChildListModelToJson(
        BrandListChildListModel instance) =>
    <String, dynamic>{
      'brand_desc': instance.brand_desc,
      'brand_id': instance.brand_id,
      'brand_img': instance.brand_img,
      'brand_name': instance.brand_name,
      'menu_id': instance.menu_id,
    };

CateListModel _$CateListModelFromJson(Map<String, dynamic> json) =>
    CateListModel(
      (json['child_list'] as List<dynamic>)
          .map(
              (e) => CateListChildListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['parent_id'] as String,
      json['parent_name'] as String,
    );

Map<String, dynamic> _$CateListModelToJson(CateListModel instance) =>
    <String, dynamic>{
      'child_list': instance.child_list,
      'parent_id': instance.parent_id,
      'parent_name': instance.parent_name,
    };

CateListChildListModel _$CateListChildListModelFromJson(
        Map<String, dynamic> json) =>
    CateListChildListModel(
      json['category_id'] as String,
      json['category_img'] as String,
      json['category_name'] as String,
      json['level'] as int,
    );

Map<String, dynamic> _$CateListChildListModelToJson(
        CateListChildListModel instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'category_img': instance.category_img,
      'category_name': instance.category_name,
      'level': instance.level,
    };

SpecialListModel _$SpecialListModelFromJson(Map<String, dynamic> json) =>
    SpecialListModel(
      (json['child_list'] as List<dynamic>)
          .map((e) =>
              SpecialListChildListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['parent_name'] as String,
    );

Map<String, dynamic> _$SpecialListModelToJson(SpecialListModel instance) =>
    <String, dynamic>{
      'child_list': instance.child_list,
      'parent_name': instance.parent_name,
    };

SpecialListChildListModel _$SpecialListChildListModelFromJson(
        Map<String, dynamic> json) =>
    SpecialListChildListModel(
      json['category_id'] as String,
      json['category_img'] as String,
      json['category_name'] as String,
      json['level'] as int,
    );

Map<String, dynamic> _$SpecialListChildListModelToJson(
        SpecialListChildListModel instance) =>
    <String, dynamic>{
      'category_id': instance.category_id,
      'category_img': instance.category_img,
      'category_name': instance.category_name,
      'level': instance.level,
    };
