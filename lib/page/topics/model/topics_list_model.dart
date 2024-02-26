/// Created by Ian on 2024/2/26
/// Email: yixin0212@qq.com
/// Function :
import 'package:json_annotation/json_annotation.dart';

part 'topics_list_model.g.dart';

@JsonSerializable()
class TopicsListModel extends Object {
  List<TopicsListActModel> list;
  String pageIndex;
  String pageSize;
  String total;

  List<TopicsListTopModel> topicsList;

  TopicsListModel(
      this.list, this.pageIndex, this.pageSize, this.topicsList, this.total);

  factory TopicsListModel.fromJson(Map<String, dynamic> srcJson) =>
      _$TopicsListModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopicsListModelToJson(this);
}

@JsonSerializable()
class TopicsListTopModel extends Object {
  int activity_id;
  String activity_desc;
  String activity_img;
  String activity_name;
  String activity_url;
  String product_count;

  TopicsListTopModel(this.activity_id, this.activity_desc, this.activity_img,
      this.activity_name, this.activity_url, this.product_count);

  factory TopicsListTopModel.fromJson(Map<String, dynamic> srcJson) =>
      _$TopicsListTopModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopicsListTopModelToJson(this);
}

@JsonSerializable()
class TopicsListActModel extends Object {
  int activity_id;

  String activity_img;

  String activity_name;

  String activity_url;

  List<TopicsListActProductModel> list;

  String product_count;

  TopicsListActModel(
    this.activity_id,
    this.activity_img,
    this.activity_name,
    this.activity_url,
    this.list,
    this.product_count,
  );

  factory TopicsListActModel.fromJson(Map<String, dynamic> srcJson) =>
      _$TopicsListActModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopicsListActModelToJson(this);
}

@JsonSerializable()
class TopicsListActProductModel extends Object {
  String newPrice;

  String product_id;

  String product_img;

  String product_title;

  String stock_status;

  TopicsListActProductModel(
    this.newPrice,
    this.product_id,
    this.product_img,
    this.product_title,
    this.stock_status,
  );

  factory TopicsListActProductModel.fromJson(Map<String, dynamic> srcJson) =>
      _$TopicsListActProductModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TopicsListActProductModelToJson(this);
}
