import 'package:json_annotation/json_annotation.dart';

/// Created by Ian on 2024/1/31
/// Email: yixin0212@qq.com
/// Function :  商品列表

part 'home_act_product_list_model.g.dart';

@JsonSerializable()
class HomeActProductListModel extends Object {
  String newPrice = "";
  String product_id = "";
  String product_sku = "";

  String product_img = "";


  HomeActProductListModel(
      this.newPrice, this.product_id, this.product_sku, this.product_img);

  factory HomeActProductListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$HomeActProductListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeActProductListModelToJson(this);
}
