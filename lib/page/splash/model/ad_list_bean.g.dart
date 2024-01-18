// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ad_list_bean.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdListBean _$AdListBeanFromJson(Map<String, dynamic> json) => AdListBean(
      (json['list'] as List<dynamic>)
          .map((e) => AdListInfoBean.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AdListBeanToJson(AdListBean instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

AdListInfoBean _$AdListInfoBeanFromJson(Map<String, dynamic> json) =>
    AdListInfoBean(
      json['title'] as String,
      json['category_id'] as String,
      json['url'] as String,
      json['imageUrl'] as String,
      json['jumpType'] as String,
    );

Map<String, dynamic> _$AdListInfoBeanToJson(AdListInfoBean instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category_id': instance.categoryId,
      'url': instance.url,
      'imageUrl': instance.imageUrl,
      'jumpType': instance.jumpType,
    };
