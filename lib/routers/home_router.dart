import 'package:fluro/fluro.dart';
import 'package:ian_mall_flutter/page/home/view/home_page.dart';
import 'package:ian_mall_flutter/routers/irouter_provider.dart';

import '../page/tabbar/view/tabber_page.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 首页路由
class HomeRouter extends IRouterProvider {
  static const homePage = "/page/tabbar/view/tabber_page.dart"; //首页

  static const categoryPage = "/page/tabbar/view/tabber_page.dart"; //二级分类页

  @override
  void initRouter(FluroRouter router) {
    /// 首页详情
    router.define(homePage, handler: Handler(handlerFunc: (context, params) {
      Map? argument = context!.settings!.arguments as Map?;
      int  indexPage= argument?['indexPage'];

      return TabbarPage( indexPage: indexPage,);
    }));
  }
}
