// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_act_product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeActProductListModel _$HomeActProductListModelFromJson(
        Map<String, dynamic> json) =>
    HomeActProductListModel(
      json['newPrice'] as String,
      json['product_id'] as String,
      json['product_sku'] as String,
      json['product_img'] as String,
    );

Map<String, dynamic> _$HomeActProductListModelToJson(
        HomeActProductListModel instance) =>
    <String, dynamic>{
      'newPrice': instance.newPrice,
      'product_id': instance.product_id,
      'product_sku': instance.product_sku,
      'product_img': instance.product_img,
    };
