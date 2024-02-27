import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_child_model.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_act_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';

/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function :
class MineState extends BaseState {
  List<CategoryInfoModel>? categoryInfoModel;//左
  CategoryInfoChildModel? categoryInfoChildModel; // 右

  MineState() {
    categoryInfoModel = [];
    categoryInfoChildModel = null;
  }
}
