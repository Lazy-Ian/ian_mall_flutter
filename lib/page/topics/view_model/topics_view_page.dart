import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/base_view_model.dart';
import 'package:ian_mall_flutter/config/handle_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/dio_utils.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_list_model.dart';
import 'package:ian_mall_flutter/page/topics/model/topics_list_model.dart';
import 'package:ian_mall_flutter/page/topics/state/topics_state.dart';

/// Created by Ian on 2024/2/19
/// Email: yixin0212@qq.com
/// Function :
class TopicsViewModel extends BaseViewModel {
  TopicsState state = TopicsState();

  ///左
  Future<void> getTopicsList(int pageIndex) async {
    var params = {'pageIndex': pageIndex.toString(), 'pageSize': '15'};
    ResponseModel? responseModel =
        await DioUtils().request<TopicsListModel>(
      ApiUrl.getTopicsList,params: params
    );
    state.netState = HandleState.handle(responseModel);
    if (state.netState == NetState.dataSuccessState) {
      TopicsListModel listModel = responseModel.data;
      state.topicsListActModel = listModel.list;
      state.topicsListTopModel = listModel.topicsList;
    }
    notifyListeners();
  }
}
