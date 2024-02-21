import 'package:json_annotation/json_annotation.dart';

/// Created by Ian on 2024/1/24
/// Email: yixin0212@qq.com
/// Function :


part 'category_info_child_model.g.dart';


@JsonSerializable()
class CategoryInfoChildModel extends Object {

  ActivityBannerModel activity_banner;

  BrandListModel brand_list;

  List<CateListModel> cate_list;

  SpecialListModel special_list;

  CategoryInfoChildModel(this.activity_banner,this.brand_list,this.cate_list,this.special_list,);

  factory CategoryInfoChildModel.fromJson(Map<String, dynamic> srcJson) => _$CategoryInfoChildModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoryInfoChildModelToJson(this);

}


@JsonSerializable()
class ActivityBannerModel extends Object {

  String activity_img;

  String activity_title;

  String activity_url;

  ActivityBannerModel(this.activity_img,this.activity_title,this.activity_url,);

  factory ActivityBannerModel.fromJson(Map<String, dynamic> srcJson) => _$ActivityBannerModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ActivityBannerModelToJson(this);

}


@JsonSerializable()
class BrandListModel extends Object {

  List<BrandListChildListModel> child_list;

  String parent_name;

  BrandListModel(this.child_list,this.parent_name,);

  factory BrandListModel.fromJson(Map<String, dynamic> srcJson) => _$BrandListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandListModelToJson(this);

}


@JsonSerializable()
class BrandListChildListModel extends Object {

  String brand_desc;

  String brand_id;

  String brand_img;

  String brand_name;

  String menu_id;

  BrandListChildListModel(this.brand_desc,this.brand_id,this.brand_img,this.brand_name,this.menu_id,);

  factory BrandListChildListModel.fromJson(Map<String, dynamic> srcJson) => _$BrandListChildListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BrandListChildListModelToJson(this);

}


@JsonSerializable()
class CateListModel extends Object {

  List<CateListChildListModel> child_list;

  String parent_id;

  String parent_name;

  CateListModel(this.child_list,this.parent_id,this.parent_name,);

  factory CateListModel.fromJson(Map<String, dynamic> srcJson) => _$CateListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CateListModelToJson(this);

}


@JsonSerializable()
class CateListChildListModel extends Object {

  String category_id;

  String category_img;

  String category_name;

  int level;

  CateListChildListModel(this.category_id,this.category_img,this.category_name,this.level,);

  factory CateListChildListModel.fromJson(Map<String, dynamic> srcJson) => _$CateListChildListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CateListChildListModelToJson(this);

}


@JsonSerializable()
class SpecialListModel extends Object {

  List<SpecialListChildListModel> child_list;

  String parent_name;

  SpecialListModel(this.child_list,this.parent_name,);

  factory SpecialListModel.fromJson(Map<String, dynamic> srcJson) => _$SpecialListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecialListModelToJson(this);

}

@JsonSerializable()
class SpecialListChildListModel extends Object {

  String category_id;

  String category_img;

  String category_name;

  int level;

  SpecialListChildListModel(this.category_id,this.category_img,this.category_name,this.level,);

  factory SpecialListChildListModel.fromJson(Map<String, dynamic> srcJson) => _$SpecialListChildListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SpecialListChildListModelToJson(this);

}
