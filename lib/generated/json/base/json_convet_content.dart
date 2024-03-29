import 'package:flutter/material.dart' show debugPrint;
import 'package:ian_mall_flutter/page/category/model/category_info_child_model.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_list_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_act_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';
import 'package:ian_mall_flutter/page/splash/model/ad_list_bean.dart';
import 'package:ian_mall_flutter/page/topics/model/topics_list_model.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 解析神器
JsonConvert jsonConvert = JsonConvert();

typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);
typedef EnumConvertFunction<T> = T Function(String value);

class JsonConvert {
  static final Map<String, JsonConvertFunction> convertFuncMap = {
    (TopicsListModel).toString(): TopicsListModel.fromJson,
    (CategoryInfoChildModel).toString(): CategoryInfoChildModel.fromJson,
    (CategoryInfoListModel).toString(): CategoryInfoListModel.fromJson,
    (HomeRecTabProductListModel).toString(): HomeRecTabProductListModel.fromJson,
    (HomeRecActModel).toString(): HomeRecActModel.fromJson,
    (HomeBannerBean).toString(): HomeBannerBean.fromJson,
    (AdListBean).toString(): AdListBean.fromJson,
  };

  //list is returned by type
  static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
    if (<TopicsListModel>[] is M) {
      return data
          .map<TopicsListModel>(
              (Map<String, dynamic> e) => TopicsListModel.fromJson(e))
          .toList() as M;
    }
      if (<CategoryInfoChildModel>[] is M) {
      return data
          .map<CategoryInfoChildModel>(
              (Map<String, dynamic> e) => CategoryInfoChildModel.fromJson(e))
          .toList() as M;
    }
     if (<CategoryInfoListModel>[] is M) {
      return data
          .map<CategoryInfoListModel>(
              (Map<String, dynamic> e) => CategoryInfoListModel.fromJson(e))
          .toList() as M;
    }
      if (<HomeRecTabProductListModel>[] is M) {
      return data
          .map<HomeRecTabProductListModel>(
              (Map<String, dynamic> e) => HomeRecTabProductListModel.fromJson(e))
          .toList() as M;
    }
    if (<HomeRecActModel>[] is M) {
      return data
          .map<HomeRecActModel>(
              (Map<String, dynamic> e) => HomeRecActModel.fromJson(e))
          .toList() as M;
    }
    if (<HomeBannerBean>[] is M) {
      return data
          .map<HomeBannerBean>(
              (Map<String, dynamic> e) => HomeBannerBean.fromJson(e))
          .toList() as M;
    }
    if (<AdListBean>[] is M) {
      return data
          .map<AdListBean>((Map<String, dynamic> e) => AdListBean.fromJson(e))
          .toList() as M;
    }

    debugPrint("${M.toString()} not found");

    return null;
  }

  T? convert<T>(dynamic value, {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    try {
      return _asT<T>(value, enumConvert: enumConvert);
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

  List<T?>? convertList<T>(List<dynamic>? value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return value
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert))
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>)
          .map((dynamic e) => _asT<T>(e, enumConvert: enumConvert)!)
          .toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? _asT<T extends Object?>(dynamic value,
      {EnumConvertFunction? enumConvert}) {
    final String type = T.toString();
    final String valueS = value.toString();
    if (enumConvert != null) {
      return enumConvert(valueS) as T;
    } else if (type == "String") {
      return valueS as T;
    } else if (type == "int") {
      final int? intValue = int.tryParse(valueS);
      if (intValue == null) {
        return double.tryParse(valueS)?.toInt() as T?;
      } else {
        return intValue as T;
      }
    } else if (type == "double") {
      return double.parse(valueS) as T;
    } else if (type == "DateTime") {
      return DateTime.parse(valueS) as T;
    } else if (type == "bool") {
      if (valueS == '0' || valueS == '1') {
        return (valueS == '1') as T;
      }
      return (valueS == 'true') as T;
    } else if (type == "Map" || type.startsWith("Map<")) {
      return value as T;
    } else {
      if (convertFuncMap.containsKey(type)) {
        return convertFuncMap[type]!(Map<String, dynamic>.from(value)) as T;
      } else {
        throw UnimplementedError('$type unimplemented');
      }
    }
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json is List) {
      return _getListChildType<M>(
          json.map((e) => e as Map<String, dynamic>).toList());
    } else {
      return jsonConvert.convert<M>(json);
    }
  }
}
