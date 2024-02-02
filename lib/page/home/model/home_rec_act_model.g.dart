// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_rec_act_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeRecActModel _$HomeRecActModelFromJson(Map<String, dynamic> json) =>
    HomeRecActModel(
      (json['list'] as List<dynamic>)
          .map((e) => ActModelList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeRecActModelToJson(HomeRecActModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };

ActModelList _$ActModelListFromJson(Map<String, dynamic> json) => ActModelList(
      (json['product_list'] as List<dynamic>)
          .map((e) => ProductListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['sub_title'] as String,
      json['title'] as String,
      json['type'] as String,
      json['url'] as String,
    );

Map<String, dynamic> _$ActModelListToJson(ActModelList instance) =>
    <String, dynamic>{
      'product_list': instance.product_list,
      'sub_title': instance.sub_title,
      'title': instance.title,
      'type': instance.type,
      'url': instance.url,
    };
