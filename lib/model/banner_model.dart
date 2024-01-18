import 'dart:convert';

import 'package:ian_mall_flutter/generated/json/banner_model.g.dart';
import 'package:ian_mall_flutter/generated/json/base/json_field.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 

@JsonSerializable()
class BannerModel {
  int? id;
  String? title;
  String? img;
  int? jump_type;
  String? jump_value;
  String? img2;
  String? bg;
  BannerModel();

  factory BannerModel.fromJson(Map<String, dynamic> json) => $BannerModelFromJson(json);

  Map<String, dynamic> toJson() => $BannerModelToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}
