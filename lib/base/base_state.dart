/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function :
abstract class BaseState {
  /// 页面状态
  NetState netState = NetState.loadingState;
}
enum NetState {
  /// 加载状态
  loadingState,

  /// 错误状态,显示失败界面
  error404State,

  /// 错误状态,显示刷新按钮
  errorShowRefresh,

  /// 空数据状态
  emptyDataState,

  /// 加载超时
  timeOutState,

  /// 数据获取成功状态
  dataSuccessState,

  /// 取消请求
  cancelRequest,

  /// 未知情况
  unknown;
}
