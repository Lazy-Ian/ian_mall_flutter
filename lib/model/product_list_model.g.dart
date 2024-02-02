// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductListModel _$ProductListModelFromJson(Map<String, dynamic> json) =>
    ProductListModel(
      json['brand_desc'] as String,
      json['brand_id'] as String,
      json['brand_name'] as String,
      CellInfoModel.fromJson(json['cell_info'] as Map<String, dynamic>),
      json['cell_type'] as String,
      json['discount'] as String,
      json['exclusivePrice'] as String,
      json['finalPrice'] as String,
      json['group_number'] as int,
      json['groupPrice'] as String,
      json['groupSavePrice'] as String,
      json['hasVideo'] as String,
      json['hotSaleDesc'] as String,
      json['isCollection'] as String,
      json['isGroup'] as String,
      json['newPrice'] as String,
      json['oldPrice'] as String,
      json['product_id'] as String,
      json['product_img'] as String,
      json['product_title'] as String,
      json['stock_status'] as String,
      (json['tag_list'] as List<dynamic>)
          .map((e) => TagListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['guaranteePrice'] as String,
    );

Map<String, dynamic> _$ProductListModelToJson(ProductListModel instance) =>
    <String, dynamic>{
      'brand_desc': instance.brand_desc,
      'brand_id': instance.brand_id,
      'brand_name': instance.brand_name,
      'cell_info': instance.cell_info,
      'cell_type': instance.cell_type,
      'discount': instance.discount,
      'exclusivePrice': instance.exclusivePrice,
      'finalPrice': instance.finalPrice,
      'group_number': instance.group_number,
      'groupPrice': instance.groupPrice,
      'groupSavePrice': instance.groupSavePrice,
      'hasVideo': instance.hasVideo,
      'hotSaleDesc': instance.hotSaleDesc,
      'isCollection': instance.isCollection,
      'isGroup': instance.isGroup,
      'newPrice': instance.newPrice,
      'oldPrice': instance.oldPrice,
      'product_id': instance.product_id,
      'product_img': instance.product_img,
      'product_title': instance.product_title,
      'stock_status': instance.stock_status,
      'tag_list': instance.tag_list,
      'guaranteePrice': instance.guaranteePrice,
    };

CellInfoModel _$CellInfoModelFromJson(Map<String, dynamic> json) =>
    CellInfoModel(
      json['activity_content'] as String,
      json['activity_url'] as String,
      json['cell_header'] as String,
      json['cell_id'] as String,
      json['cell_title'] as String,
    );

Map<String, dynamic> _$CellInfoModelToJson(CellInfoModel instance) =>
    <String, dynamic>{
      'activity_content': instance.activity_content,
      'activity_url': instance.activity_url,
      'cell_header': instance.cell_header,
      'cell_id': instance.cell_id,
      'cell_title': instance.cell_title,
    };

TagListModel _$TagListModelFromJson(Map<String, dynamic> json) => TagListModel(
      json['tag_id'] as String,
      json['tag_name'] as String,
      json['tag_type'] as String,
    );

Map<String, dynamic> _$TagListModelToJson(TagListModel instance) =>
    <String, dynamic>{
      'tag_id': instance.tag_id,
      'tag_name': instance.tag_name,
      'tag_type': instance.tag_type,
    };
