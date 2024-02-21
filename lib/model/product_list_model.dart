import 'package:json_annotation/json_annotation.dart';

/// Created by Ian on 2024/1/31
/// Email: yixin0212@qq.com
/// Function :  商品列表


part 'product_list_model.g.dart';


@JsonSerializable()
class ProductListModel extends Object {

  String brand_desc =  "";

  String brand_id =  "";

  String brand_name =  "";

  CellInfoModel cell_info = CellInfoModel("","","","","");

  String cell_type  =  "";

  String discount =  "";

  String exclusivePrice =  "";

  String finalPrice =  "";

  int group_number = -1;

  String groupPrice =  "";

  String groupSavePrice =  "";

  String hasVideo =  "";

  String hotSaleDesc =  "";

  String isCollection =  "";

  String isGroup =  "";

  String newPrice =  "";

  String oldPrice =  "";

  String product_id =  "";

  String product_img =  "";

  String product_title =  "";

  String stock_status =  "";

  List<TagListModel> tag_list =  [];

  String guaranteePrice =  "";

  ProductListModel(this.brand_desc,this.brand_id,this.brand_name,this.cell_info,this.cell_type,this.discount,this.exclusivePrice,this.finalPrice,this.group_number,this.groupPrice,this.groupSavePrice,this.hasVideo,this.hotSaleDesc,this.isCollection,this.isGroup,this.newPrice,this.oldPrice,this.product_id,this.product_img,this.product_title,this.stock_status,this.tag_list,this.guaranteePrice,);

  factory ProductListModel.fromJson(Map<String, dynamic> srcJson) => _$ProductListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ProductListModelToJson(this);

}


@JsonSerializable()
class CellInfoModel extends Object {

  String activity_content =  "";

  String activity_url =  "";

  String cell_header =  "";

  String cell_id =  "";

  String cell_title =  "";

  CellInfoModel(this.activity_content,this.activity_url,this.cell_header,this.cell_id,this.cell_title,);

  factory CellInfoModel.fromJson(Map<String, dynamic> srcJson) => _$CellInfoModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CellInfoModelToJson(this);

}


@JsonSerializable()
class TagListModel extends Object {

  String tag_id = "";

  String tag_name = "";

  String tag_type = "";

  TagListModel(this.tag_id,this.tag_name,this.tag_type,);

  factory TagListModel.fromJson(Map<String, dynamic> srcJson) => _$TagListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagListModelToJson(this);

}


