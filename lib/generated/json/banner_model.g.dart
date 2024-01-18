
import 'package:ian_mall_flutter/generated/json/base/json_convet_content.dart';
import 'package:ian_mall_flutter/model/banner_model.dart';

BannerModel $BannerModelFromJson(Map<String, dynamic> json) {
	final BannerModel bannerModel = BannerModel();
	final int? id = jsonConvert.convert<int>(json['id']);
	if (id != null) {
		bannerModel.id = id;
	}
	final String? title = jsonConvert.convert<String>(json['title']);
	if (title != null) {
		bannerModel.title = title;
	}
	final String? img = jsonConvert.convert<String>(json['img']);
	if (img != null) {
		bannerModel.img = img;
	}
	final int? jump_type = jsonConvert.convert<int>(json['jump_type']);
	if (jump_type != null) {
		bannerModel.jump_type = jump_type;
	}
	final String? jump_value = jsonConvert.convert<String>(json['jump_value']);
	if (jump_value != null) {
		bannerModel.jump_value = jump_value;
	}
	final String? img2 = jsonConvert.convert<String>(json['img2']);
	if (img2 != null) {
		bannerModel.img2 = img2;
	}
	final String? bg = jsonConvert.convert<String>(json['bg']);
	if (bg != null) {
		bannerModel.bg = bg;
	}
	return bannerModel;
}

Map<String, dynamic> $BannerModelToJson(BannerModel entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['title'] = entity.title;
	data['img'] = entity.img;
	data['jump_type'] = entity.jump_type;
	data['jump_value'] = entity.jump_value;
	data['img2'] = entity.img2;
	data['bg'] = entity.bg;
	return data;
}