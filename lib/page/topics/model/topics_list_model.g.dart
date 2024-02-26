// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topics_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicsListModel _$TopicsListModelFromJson(Map<String, dynamic> json) =>
    TopicsListModel(
      (json['list'] as List<dynamic>)
          .map((e) => TopicsListActModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['pageIndex'] as String,
      json['pageSize'] as String,
      (json['topicsList'] as List<dynamic>)
          .map((e) => TopicsListTopModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as String,
    );

Map<String, dynamic> _$TopicsListModelToJson(TopicsListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
      'pageIndex': instance.pageIndex,
      'pageSize': instance.pageSize,
      'total': instance.total,
      'topicsList': instance.topicsList,
    };

TopicsListTopModel _$TopicsListTopModelFromJson(Map<String, dynamic> json) =>
    TopicsListTopModel(
      json['activity_id'] as int,
      json['activity_desc'] as String,
      json['activity_img'] as String,
      json['activity_name'] as String,
      json['activity_url'] as String,
      json['product_count'] as String,
    );

Map<String, dynamic> _$TopicsListTopModelToJson(TopicsListTopModel instance) =>
    <String, dynamic>{
      'activity_id': instance.activity_id,
      'activity_desc': instance.activity_desc,
      'activity_img': instance.activity_img,
      'activity_name': instance.activity_name,
      'activity_url': instance.activity_url,
      'product_count': instance.product_count,
    };

TopicsListActModel _$TopicsListActModelFromJson(Map<String, dynamic> json) =>
    TopicsListActModel(
      json['activity_id'] as int,
      json['activity_img'] as String,
      json['activity_name'] as String,
      json['activity_url'] as String,
      (json['list'] as List<dynamic>)
          .map((e) =>
              TopicsListActProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['product_count'] as String,
    );

Map<String, dynamic> _$TopicsListActModelToJson(TopicsListActModel instance) =>
    <String, dynamic>{
      'activity_id': instance.activity_id,
      'activity_img': instance.activity_img,
      'activity_name': instance.activity_name,
      'activity_url': instance.activity_url,
      'list': instance.list,
      'product_count': instance.product_count,
    };

TopicsListActProductModel _$TopicsListActProductModelFromJson(
        Map<String, dynamic> json) =>
    TopicsListActProductModel(
      json['newPrice'] as String,
      json['product_id'] as String,
      json['product_img'] as String,
      json['product_title'] as String,
      json['stock_status'] as String,
    );

Map<String, dynamic> _$TopicsListActProductModelToJson(
        TopicsListActProductModel instance) =>
    <String, dynamic>{
      'newPrice': instance.newPrice,
      'product_id': instance.product_id,
      'product_img': instance.product_img,
      'product_title': instance.product_title,
      'stock_status': instance.stock_status,
    };
