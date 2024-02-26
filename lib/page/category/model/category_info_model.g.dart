// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryInfoModel _$CategoryInfoModelFromJson(Map<String, dynamic> json) =>
    CategoryInfoModel(
      json['menu_id'] as String,
      json['menu_name'] as String,
      json['national_pavilion_url'] as String,
    );

Map<String, dynamic> _$CategoryInfoModelToJson(CategoryInfoModel instance) =>
    <String, dynamic>{
      'menu_id': instance.menu_id,
      'menu_name': instance.menu_name,
      'national_pavilion_url': instance.national_pavilion_url,
    };
