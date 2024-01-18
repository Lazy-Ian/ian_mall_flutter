import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/model/response_model.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 处理网络层根据 ResponseModel 给state改变状态

class HandleState {
  /// successCode 即后端返回数据成功的code,这个参数是为了后端接口返回code不一致.
  static NetState handle(ResponseModel responseModel, {int? successCode = 100200}) {
    if (responseModel.code == successCode) {
      return NetState.dataSuccessState;
    } else if (responseModel.code == 404) {
      return NetState.error404State;
    } else if (responseModel.code == -100) {
      return NetState.timeOutState;
    } else if (responseModel.code == 500) {
      return NetState.errorShowRefresh;
    }else if(responseModel.code == -1) {
      return NetState.cancelRequest;
    }
    return NetState.unknown;
  }
}
