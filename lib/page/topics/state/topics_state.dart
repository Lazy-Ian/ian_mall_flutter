import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_child_model.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_act_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';
import 'package:ian_mall_flutter/page/topics/model/topics_list_model.dart';

/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function :
class TopicsState extends BaseState {
  List<TopicsListTopModel>? topicsListTopModel;// banner
  List<TopicsListActModel>? topicsListActModel;//
  TopicsState() {
    topicsListActModel = [];
    topicsListTopModel = [];
  }
}
