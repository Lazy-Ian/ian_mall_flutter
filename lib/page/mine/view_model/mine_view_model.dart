import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/config/handle_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_list_model.dart';
import 'package:ian_mall_flutter/page/mine/state/mine_state.dart';

/// Created by Ian on 2024/2/26
/// Email: yixin0212@qq.com
/// Function : 
class MineViewModel extends BaseViewModel {
  MineState state = MineState();

  ///左
  Future<void> getParentCategories() async {
    var params = {
      'type': "0",
    };
    ResponseModel? responseModel = await DioUtils()
        .request<CategoryInfoListModel>(ApiUrl.getParentCategories,
        params: params);
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      CategoryInfoListModel listModel = responseModel.data;
      state.categoryInfoModel = listModel.list;
    }
    notifyListeners();
  }

}
