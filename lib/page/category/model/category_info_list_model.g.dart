// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_info_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryInfoListModel _$CategoryInfoListModelFromJson(
        Map<String, dynamic> json) =>
    CategoryInfoListModel(
      (json['list'] as List<dynamic>)
          .map((e) => CategoryInfoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryInfoListModelToJson(
        CategoryInfoListModel instance) =>
    <String, dynamic>{
      'list': instance.list,
    };
