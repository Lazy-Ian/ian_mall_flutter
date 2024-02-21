import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/config/handle_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_child_model.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_model.dart';
import 'package:ian_mall_flutter/page/category/state/category_state.dart';

/// Created by Ian on 2024/2/19
/// Email: yixin0212@qq.com
/// Function :
class CategoryViewModel extends BaseViewModel {
  CategoryState state = CategoryState();

  ///左
  Future<void> getParentCategories() async {
    ResponseModel? responseModel =
    await DioUtils().request<CategoryInfoModel>(ApiUrl.getParentCategories);
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      state.categoryInfoModel = responseModel.data;
    }
    notifyListeners();
  }
  ///右
  Future<void> getChildCategories() async {
    ResponseModel? responseModel =
    await DioUtils().request<CategoryInfoChildModel>(ApiUrl.getChildCategories);
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      state.categoryInfoChildModel = responseModel.data;
    }
    notifyListeners();
  }

}
