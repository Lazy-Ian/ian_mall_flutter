import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class BaseViewModel extends ChangeNotifier {
  /// 列表控制器
  final ScrollController scrollController = ScrollController();

  /// 刷新组建控制器
  final RefreshController refreshController =
      RefreshController(initialRefresh: false);
}
