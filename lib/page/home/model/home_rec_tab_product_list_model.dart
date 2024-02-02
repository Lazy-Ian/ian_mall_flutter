import 'package:ian_mall_flutter/model/product_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_rec_tab_product_list_model.g.dart';


@JsonSerializable()
class HomeRecTabProductListModel extends Object {

  BrandInfoModel brand_info;

  String category_id;

  List<TabList> list;

  int pageIndex;

  int pageSize;

  List<ProductListModel> product_list;

  int total;

  HomeRecTabProductListModel(this.brand_info,this.category_id,this.list,this.pageIndex,this.pageSize,this.product_list,this.total,);

  factory HomeRecTabProductListModel.fromJson(Map<String, dynamic> srcJson) => _$HomeRecTabProductListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecTabProductListModelToJson(this);

}


@JsonSerializable()
class BrandInfoModel extends Object {

  String brand_id;

  String brand_img;

  String brand_name;

  List<ProductListModel> product_list;

  String product_size;

  BrandInfoModel(this.brand_id,this.brand_img,this.brand_name,this.product_list,this.product_size,);

  factory BrandInfoModel.fromJson(Map<String, dynamic> srcJson) => _$BrandInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandInfoModelToJson(this);

}


@JsonSerializable()
class TabList extends Object {

  String category_id;

  String category_sub_title;

  String category_title;

  TabList(this.category_id,this.category_sub_title,this.category_title,);

  factory TabList.fromJson(Map<String, dynamic> srcJson) => _$TabListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TabListToJson(this);

}


