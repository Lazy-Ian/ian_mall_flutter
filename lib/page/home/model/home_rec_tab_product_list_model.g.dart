// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_rec_tab_product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecTabProductListModel _$HomeRecTabProductListModelFromJson(
        Map<String, dynamic> json) =>
    HomeRecTabProductListModel(
      BrandInfoModel.fromJson(json['brand_info'] as Map<String, dynamic>),
      json['category_id'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => TabList.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pageIndex'] as int,
      json['pageSize'] as int,
      (json['product_list'] as List<dynamic>)
          .map((e) => ProductListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$HomeRecTabProductListModelToJson(
        HomeRecTabProductListModel instance) =>
    <String, dynamic>{
      'brand_info': instance.brand_info,
      'category_id': instance.category_id,
      'list': instance.list,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'product_list': instance.product_list,
      'total': instance.total,
    };

BrandInfoModel _$BrandInfoModelFromJson(Map<String, dynamic> json) =>
    BrandInfoModel(
      json['brand_id'] as String,
      json['brand_img'] as String,
      json['brand_name'] as String,
      (json['product_list'] as List<dynamic>)
          .map((e) => ProductListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_size'] as String,
    );

Map<String, dynamic> _$BrandInfoModelToJson(BrandInfoModel instance) =>
    <String, dynamic>{
      'brand_id': instance.brand_id,
      'brand_img': instance.brand_img,
      'brand_name': instance.brand_name,
      'product_list': instance.product_list,
      'product_size': instance.product_size,
    };

TabList _$TabListFromJson(Map<String, dynamic> json) => TabList(
      json['category_id'] as String,
      json['category_sub_title'] as String,
      json['category_title'] as String,
    );

Map<String, dynamic> _$TabListToJson(TabList instance) => <String, dynamic>{
      'category_id': instance.category_id,
      'category_sub_title': instance.category_sub_title,
      'category_title': instance.category_title,
    };
