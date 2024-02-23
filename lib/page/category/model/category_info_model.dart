import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

/// Created by Ian on 2024/1/24
/// Email: yixin0212@qq.com
/// Function :

part 'category_info_model.g.dart';

@JsonSerializable()
class CategoryInfoModel extends Object {
  String menu_id;
  String menu_name;
  String national_pavilion_url;

  CategoryInfoModel(this.menu_id, this.menu_name, this.national_pavilion_url);

  factory CategoryInfoModel.fromJson(Map<String, dynamic> srcJson) =>
      _$CategoryInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryInfoModelToJson(this);
}
