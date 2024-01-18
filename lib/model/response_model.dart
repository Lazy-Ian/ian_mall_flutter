import 'package:ian_mall_flutter/generated/json/base/json_convet_content.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 返回数据
class ResponseModel<T> {
  T? data;
  int? code;
  String? message;

  ResponseModel({
    required this.data,
    required this.code,
    required this.message,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null && json['data'] != 'null') {
      data = JsonConvert.fromJsonAsT<T>(json['data']);
    }
    code = json['code'];
    message = json['statusDesc'];
  }

  /// 是否成功
  get isSucceed => code == 200;

  String get errorMessage => message ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data;
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}
