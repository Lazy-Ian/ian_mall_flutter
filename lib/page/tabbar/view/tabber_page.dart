import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ian_mall_flutter/base/provider_selector_widget.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/page/category/view/category_page.dart';
import 'package:ian_mall_flutter/page/home/view/home_page.dart';
import 'package:ian_mall_flutter/page/tabbar/view_model/tabbar_view_model.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class TabbarPage extends StatefulWidget {
  final int indexPage;

  const TabbarPage({super.key, required this.indexPage});

  @override
  State<TabbarPage> createState() => _TabBarPageState(indexPage);
}

class _TabBarPageState extends State<TabbarPage> {
  TabberViewModel tabberViewModel = TabberViewModel();

  _TabBarPageState(int indexPage) {
    tabberViewModel.selectIndex = indexPage;
  }

  @override
  Widget build(BuildContext context) {
    return ProviderSelectorWidget<TabberViewModel, int>(
        viewModel: tabberViewModel,
        selector: (context, index) => tabberViewModel.selectIndex,
        onReady: (viewModel) {
          viewModel.changeSelectIndex(0);
        },
        builder: (context, index, child) {
          return _buildPage(context, index);
        });
  }

  Widget _buildPage(BuildContext context, int selectIndex) {
    List<Widget> tabPageList = [
      const HomePage(),
      const CategoryPage(),
      const HomePage(),
      const HomePage(),
      const HomePage()
    ];

    ///底部tab
    Widget buildBottomTab() {
      return BottomNavigationBar(
        unselectedItemColor: const Color(0xffbbbbbb),
        selectedItemColor: const Color(0xffFF2442),
        selectedFontSize: 11.sp,
        unselectedFontSize: 9.sp,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
                child: Image(
                    fit: BoxFit.fill,
                    width: 55.w,
                    height: 37.w,
                    image: AssetImage(selectIndex == 0
                        ? "assets/images/ic_tab_home_hover.png"
                        : "assets/images/ic_tab_home.png"),
                    color: selectIndex == 0
                        ? ColorConfig.mainColor
                        : ColorConfig.secondTextColor),
              ),
              label: '首页'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
                child: Image(
                    fit: BoxFit.fill,
                    width: 55.w,
                    height: 37.w,
                    image: AssetImage(selectIndex == 1
                        ? "assets/images/ic_tab_category_selected.png"
                        : "assets/images/ic_tab_category.png"),
                    color: selectIndex == 1
                        ? ColorConfig.mainColor
                        : ColorConfig.secondTextColor),
              ),
              label: '分类'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
                child: Image(
                    fit: BoxFit.fill,
                    width: 55.w,
                    height: 37.w,
                    image: AssetImage(selectIndex == 2
                        ? "assets/images/ic_tab_topics_selected.png"
                        : "assets/images/ic_tab_topics.png"),
                    color: selectIndex == 2
                        ? ColorConfig.mainColor
                        : ColorConfig.secondTextColor),
              ),
              label: '发现'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
                child: Image(
                    fit: BoxFit.fill,
                    width: 55.w,
                    height: 37.w,
                    image: AssetImage(selectIndex == 3
                        ? "assets/images/ic_tab_cart_selected.png"
                        : "assets/images/ic_tab_car.png"),
                    color: selectIndex == 3
                        ? ColorConfig.mainColor
                        : ColorConfig.secondTextColor),
              ),
              label: '购物车'),
          BottomNavigationBarItem(
              icon: Padding(
                padding: EdgeInsets.only(top: 12.h, bottom: 6.h),
                child: Image(
                    fit: BoxFit.fill,
                    width: 55.w,
                    height: 37.w,
                    image: AssetImage(selectIndex == 4
                        ? "assets/images/ic_tab_user.png"
                        : "assets/images/ic_tab_user_selected.png"),
                    color: selectIndex == 4
                        ? ColorConfig.mainColor
                        : ColorConfig.secondTextColor),
              ),
              label: '我的'),
        ],
        currentIndex: selectIndex,
        onTap: (int index) async {
          if (selectIndex == index) {
            return;
          }
          tabberViewModel.changeSelectIndex(index);
        },
      );
    }


    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: selectIndex,
        children: tabPageList,
      ),
      // floatingActionButton: initFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomTab(),
    );
  }
}
