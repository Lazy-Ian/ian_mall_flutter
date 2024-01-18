import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'home_router.dart';
import 'irouter_provider.dart';
import 'mine_router.dart';
import 'not_found_page.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 
class Routes {
  static final List<IRouterProvider> _listRouter = [];
  static final FluroRouter router = FluroRouter();

  static void initRoutes() {
    /// 指定路由跳转错误返回页
    router.notFoundHandler =
        Handler(handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          return const NotFoundPage();
        });
    _listRouter.clear();

    /// 各自路由由各自模块管理，统一在此添加初始化
    _listRouter.add(HomeRouter());
    _listRouter.add(MineRouter());

    /// 初始化路由
    void initRouter(IRouterProvider routerProvider) {
      routerProvider.initRouter(router);
    }

    _listRouter.forEach(initRouter);
  }
}
