import 'package:json_annotation/json_annotation.dart';

part 'ad_list_bean.g.dart';

@JsonSerializable()
class AdListBean {
  @JsonKey(name: 'list')
  List<AdListInfoBean> list;

  AdListBean(
    this.list,
  );

  factory AdListBean.fromJson(Map<String, dynamic> srcJson) =>
      _$AdListBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdListBeanToJson(this);
}

@JsonSerializable()
class AdListInfoBean {
  @JsonKey(name: 'title')
  late String title;

  @JsonKey(name: 'category_id')
  late String categoryId;

  @JsonKey(name: 'url')
  late String url;

  @JsonKey(name: 'imageUrl')
  late String imageUrl;

  @JsonKey(name: 'jumpType')
  late String jumpType;

  AdListInfoBean(
    this.title,
    this.categoryId,
    this.url,
    this.imageUrl,
    this.jumpType,
  );

  factory AdListInfoBean.fromJson(Map<String, dynamic> srcJson) =>
      _$AdListInfoBeanFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AdListInfoBeanToJson(this);
}
