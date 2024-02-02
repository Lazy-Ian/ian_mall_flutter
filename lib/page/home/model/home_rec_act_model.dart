import 'package:ian_mall_flutter/model/product_list_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'home_rec_act_model.g.dart';



/// Created by Ian on 2024/1/31
/// Email: yixin0212@qq.com
/// Function : 

@JsonSerializable()
class HomeRecActModel extends Object {

  List<ActModelList> list;

  HomeRecActModel(this.list,);

  factory HomeRecActModel.fromJson(Map<String, dynamic> srcJson) => _$HomeRecActModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HomeRecActModelToJson(this);

}


@JsonSerializable()
class ActModelList extends Object {

  List<ProductListModel> product_list;

  String sub_title;

  String title;

  String type;

  String url;

  ActModelList(this.product_list,this.sub_title,this.title,this.type,this.url,);

  factory ActModelList.fromJson(Map<String, dynamic> srcJson) => _$ActModelListFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActModelListToJson(this);

}





