import 'dart:ffi';

import 'package:ian_mall_flutter/page/category/model/category_info_model.dart';
import 'package:json_annotation/json_annotation.dart';

/// Created by Ian on 2024/1/24
/// Email: yixin0212@qq.com
/// Function :

part 'category_info_list_model.g.dart';

@JsonSerializable()
class CategoryInfoListModel extends Object {
  List<CategoryInfoModel> list;

  CategoryInfoListModel(this.list);

  factory CategoryInfoListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryInfoListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryInfoListModelToJson(this);
}
