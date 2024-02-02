import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/config/handle_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_act_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';
import 'package:ian_mall_flutter/page/home/state/home_state.dart';

/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function :
class HomeViewModel extends BaseViewModel {
  HomeState state = HomeState();

  ///banner
  Future<void> getBannerData() async {
    ResponseModel? responseModel =
    await DioUtils().request<HomeBannerBean>(ApiUrl.getRecBannerUrl);
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      state.bannerInfoBean = responseModel.data;
    }
    notifyListeners();
  }

  ///自定义活动 每日特惠 最新上架
  Future<void> getRecActModel() async {
    ResponseModel? responseModel =
    await DioUtils().request<HomeRecActModel>(ApiUrl.getRecActModel);
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      state.actActModel = responseModel.data;
    }
    notifyListeners();
  }

  Future<void> getHomeRecProductListTab() async {
    var params = {
      'category_id': "0",
      'pageIndex': 1,
      'pageSize': 19,
    };
    ResponseModel? responseModel = await DioUtils()
        .request<HomeRecTabProductListModel>(
        ApiUrl.getHomeRecProductList, params: params);
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      state.tabProductListModel = responseModel.data;
    }
    notifyListeners();
  }

  Future<void> getHomeRecProductList(
  String category_id, int pageIndex) async {
  var params = {
  'category_id': category_id,
  'pageIndex': pageIndex,
  'pageSize': 19,
  };
  ResponseModel? responseModel = await DioUtils()
      .request<HomeRecTabProductListModel>(ApiUrl.getHomeRecProductList, params: params);
  state.netState = HandleState.handle(responseModel);
  if (state.netState == NetState.dataSuccessState) {
  state.tabProductListModel = responseModel.data;
  }
  notifyListeners();
  }
}
