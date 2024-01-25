import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/config/handle_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
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
}
