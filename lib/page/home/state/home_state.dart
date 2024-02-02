import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_act_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';

/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function :
class HomeState extends BaseState {
  HomeBannerBean? bannerInfoBean;//banner
  HomeRecActModel? actActModel; // 活动
  HomeRecTabProductListModel? tabProductListModel; // 推荐商品tab

  HomeState() {
    bannerInfoBean = null;
    actActModel = null;
    tabProductListModel = null;
  }
}
