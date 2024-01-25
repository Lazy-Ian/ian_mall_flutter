import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/config/handle_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/net/http_config.dart';
import 'package:ian_mall_flutter/page/splash/model/ad_list_bean.dart';
import 'package:ian_mall_flutter/page/splash/state/SplashState.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class SplashViewModel extends BaseViewModel {
  SplashState splashState = SplashState();

  /// 请求主数据
  getAdList() async {
    var params = {'flag': "1"};
    ResponseModel? responseModel = await DioUtils().request<AdListBean>(
        ApiUrl.getAdListUrl,
        params: params,
        method: HttpConfig.post);
    splashState.netState = HandleState.handle(responseModel);
    if (splashState.netState == NetState.dataSuccessState) {
      AdListBean adListBean = responseModel.data;

      splashState.dataList = adListBean.list;
      // if ((splashState.dataList ?? []).isEmpty) {
      //   splashState.netState = NetState.emptyDataState;
      // }

     }
    notifyListeners();
  }
}
