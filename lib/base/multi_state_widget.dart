import 'package:flutter/widgets.dart';
import 'package:ian_mall_flutter/base/base_state.dart';
import 'package:ian_mall_flutter/base/empty_widget.dart';
import 'package:ian_mall_flutter/base/net_error_widget.dart';
import 'package:ian_mall_flutter/base/time_out_widget.dart';
import 'package:ian_mall_flutter/widgets/placeholders.dart';

/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function :

/// 空视图 builder方法 回调函数
typedef Builder = Widget Function(BuildContext context);

enum PlaceHolderType {
  /// ListView站位
  listViewPlaceHolder,

  /// GridView站位
  gridViewPlaceHolder,

  /// StaggeredGrid 站位
  staggeredGridPlaceHolder,

  /// 详情 站位
  detailPlaceHolder,

  /// 无骨架屏展示loading
  noPlaceHolder,
}

class MultiStateWidget extends StatelessWidget {
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final String? emptyText;
  final String? errorText;
  final String? timeOutText;
  final NetState netState;
  final Builder builder;
  final Function? refreshMethod;
  final PlaceHolderType placeHolderType;
  const MultiStateWidget(
      {super.key,
        this.emptyWidget,
        this.errorWidget,
        required this.netState,
        required this.placeHolderType,
        required this.builder,
        this.refreshMethod,
        this.emptyText,
        this.errorText,
        this.timeOutText});

  @override
  Widget build(BuildContext context) {
    Widget resultWidget;
    switch (netState) {
      case NetState.error404State:
        resultWidget = NetErrorWidget(title: errorText ?? '网络404了');
        break;
      case NetState.emptyDataState:
        resultWidget = EmptyWidget(title: emptyText ?? '暂无数据');
        break;
      case NetState.errorShowRefresh:
        resultWidget = NetErrorWidget(title: errorText ?? '网络错误', refreshMethod: refreshMethod);
        break;
      case NetState.timeOutState:
        resultWidget = TimeOutWidget(title: timeOutText ?? '加载超时请重试', refreshMethod: refreshMethod);
        break;
      case NetState.loadingState:
        if (placeHolderType == PlaceHolderType.gridViewPlaceHolder) {
          resultWidget = const GridViewPlaceHolder();
        } else if (placeHolderType == PlaceHolderType.listViewPlaceHolder) {
          resultWidget = const ListViewPlaceHolder();
        } else if (placeHolderType == PlaceHolderType.staggeredGridPlaceHolder) {
          resultWidget = const StaggeredGridPlaceHolder();
        } else if (placeHolderType == PlaceHolderType.detailPlaceHolder) {
          resultWidget = const DetailPlaceHolder();
        } else {
          resultWidget = const SizedBox();
        }
        break;
      case NetState.unknown:
        resultWidget = const EmptyWidget(title: '未知错误,请退出重试');
        break;
      case NetState.cancelRequest:
        resultWidget = const SizedBox();
        break;
      case NetState.dataSuccessState:
        resultWidget = builder(context);
        break;
    }
    return resultWidget;
  }
}
