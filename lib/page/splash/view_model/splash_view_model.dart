import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/net/http_config.dart';
import 'package:ian_mall_flutter/page/splash/model/ad_list_bean.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class SplashViewModel extends BaseViewModel {
  /// 请求主数据
  getAdList() async {
    var params = {'flag': "1"};
    ResponseModel? responseModel = await DioUtils().request<AdListBean>(
        ApiUrl.serverIpUrl,
        params: params,
        method: HttpConfig.post);
    // return responseModel.data;
    notifyListeners();
  }



}
