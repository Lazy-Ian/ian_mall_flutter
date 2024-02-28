import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/page/mine/view_model/mine_view_model.dart';
import 'package:ian_mall_flutter/utils/device_util.dart';

/// Created by Ian on 2024/2/19
/// Email: yixin0212@qq.com
/// Function :
class MinePage extends BasePage {
  const MinePage({super.key});

  @override
  BasePageState<BasePage> getState() => _MinePageState();
}

class _MinePageState extends BasePageState<MinePage> {
  MineViewModel mViewModel = MineViewModel();
  int indexSelected = 0;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    super.pageTitle = '我的';
    super.isRenderHeader = false;
    super.isBack = false;
  }

  @override
  Widget buildPage(BuildContext context) {
    return ProviderConsumerWidget<MineViewModel>(
      viewModel: mViewModel,
      onReady: (viewModel) {
        mViewModel.getParentCategories();
      },
      isValue: true,
      builder: (BuildContext context, MineViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            MultiStateWidget(
              netState: viewModel.state.netState,
              placeHolderType: PlaceHolderType.noPlaceHolder,
              builder: (BuildContext context) {
                return NestedScrollView(
                  controller: viewModel.scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverOverlapAbsorber(
                        handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                            context),

                        ///SliverAppBar也可以实现吸附在顶部的TabBar，但是高度不好计算，总是会有AppBar的空白高度，
                        ///所以我就用了SliverPersistentHeader来实现这个效果，SliverAppBar的bottom中只放TabBar顶部的布局
                        sliver: SliverAppBar(
                          backgroundColor: const Color(0xfff1f1f1),
                          forceElevated: innerBoxIsScrolled,
                          bottom: PreferredSize(
                            preferredSize: const Size.fromHeight(0),
                            child: Container(
                              child: const Text("我的"),
                            ),
                          ),

                          ///TabBar顶部收缩的部分
                          flexibleSpace: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              ///banner
                              Image.asset(
                                'assets/images/bg_user_head_banner.jpg',
                                fit: BoxFit.cover,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: DeviceUtil.width(context),
                                  child: Stack(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 50.w,
                                            height: 50.w,
                                            child: const CircleAvatar(
                                              backgroundImage: AssetImage(
                                                  'assets/images/bg_user_head_banner.jpg'),
                                            ),
                                          ),
                                          Text(
                                            "登录/注册",
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: ColorConfig.textColor333,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        right: 10,
                                        top: 10,
                                        child: Container(
                                          // margin: const EdgeInsets.only(
                                          //     left: 40, right: 40, top: 40),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(18),
                                            ),
                                            color: ColorConfig.color5d,
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 8, 15, 8),
                                            child: Text(
                                              "账户设置",
                                              style: TextStyle(
                                                  color:
                                                      ColorConfig.textColorW),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  mainAxisSize: MainAxisSize.max,
                                  //交叉轴的布局方式，对于column来说就是水平方向的布局方式
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  //就是字child的垂直布局方向，向上还是向下
                                  verticalDirection: VerticalDirection.down,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("0"),
                                        Text('关注'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("0"),
                                        Text('收藏'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("0"),
                                        Text('足迹'),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("0"),
                                        Text('优惠券'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Text("我的订单"),
                                        Positioned(
                                            top: 1,
                                            right: 5,
                                            child: Text("全部订单"))
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      //交叉轴的布局方式，对于column来说就是水平方向的布局方式
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      //就是字child的垂直布局方向，向上还是向下
                                      verticalDirection: VerticalDirection.down,
                                      children: <Widget>[
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              width: 35.w,
                                              height: 35.w,
                                              child: Image.asset(
                                                'assets/images/bg_user_head_banner.jpg',
                                              ),
                                            ),
                                            Text('关注'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 35.w,
                                              height: 35.w,
                                              child: Image.asset(
                                                'assets/images/bg_user_head_banner.jpg',
                                              ),
                                            ),
                                            Text('收藏'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 35.w,
                                              height: 35.w,
                                              child: Image.asset(
                                                'assets/images/bg_user_head_banner.jpg',
                                              ),
                                            ),
                                            Text('足迹'),
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            SizedBox(
                                              width: 35.w,
                                              height: 35.w,
                                              child: Image.asset(
                                                'assets/images/bg_user_head_banner.jpg',
                                              ),
                                            ),
                                            Text('优惠券'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Image.asset(
                                'assets/images/bg_user_head_banner.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/bg_user_head_banner.jpg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/images/bg_user_head_banner.jpg',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ];
                  },
                  body: const Text("123"),
                );
              },
            ),
          ],
        );
      },
    );
  }

  SliverAppBar buildSliverAppBar() {
    return const SliverAppBar(
      title: Text("讲解组合滑动"),
    );
  }

  SliverGrid buildSliverGrid() {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        ///九宫格的列数
        crossAxisCount: 3,

        ///子Widget 宽与高的比值
        childAspectRatio: 2.0,

        ///主方向的 两个 子Widget 之间的间距
        mainAxisSpacing: 10,

        /// 次方向 子Widget 之间的间距
        crossAxisSpacing: 10,
      ),

      ///子Item构建器
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, num index) {
          ///每一个子Item的样式
          return Container(
            color: Colors.blue,
            child: Text("grid $index"),
          );
        },

        ///子Item的个数
        childCount: 10,
      ),
    );
  }

  SliverFixedExtentList buildSliverFixedExtentList() {
    return SliverFixedExtentList(
      ///子条目的高度
      itemExtent: 40,

      ///子条目布局构建代理
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, num index) {
          ///子条目的布局样式
          return Container(
            color: Colors.red,
            margin: const EdgeInsets.only(bottom: 10),
            child: Text("list $index"),
          );
        },

        ///子条目的个数
        childCount: 40,
      ),
    );
  }
}
//return Material(
//                   child: CustomScrollView(
//                     slivers: <Widget>[
//                       // 类似AppBar，包括一个导航栏，两者不同之处在于SliverAppBar可以集成到CustomScrollView。
//                       // SliverAppBar可以结合FlexibleSpaceBar实现Material Design中头部伸缩的模型。
//                       SliverAppBar(
//                         pinned: true,
//                         expandedHeight: 90.0,
//                         flexibleSpace: FlexibleSpaceBar(
//                           title: const Text(''),
//                           background: Image.asset('assets/images/bg_user_head_banner.jpg', fit: BoxFit.cover,),
//                         ),
//                       ),
//                       // const SliverPadding(
//                       //   padding: EdgeInsets.all(8.0),
//                       //   sliver: CircleAvatar(
//                       //     backgroundImage: AssetImage('assets/images/bg_user_head_banner.jpg'),
//                       //   ),
//                       // ),
//                       // 用SliverPadding包裹以给SliverGrid添加补白。SliverGrid是一个两列，宽高比为4的网格，它有20个子组件。
//                       SliverPadding(
//                         padding: const EdgeInsets.all(8.0),
//                         sliver: SliverGrid(
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             // Grid按两列显示
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 10.0,
//                             crossAxisSpacing: 10.0,
//                             childAspectRatio: 4.0,
//                           ),
//                           delegate: SliverChildBuilderDelegate((BuildContext context, int index){
//                             // 创建子widget
//                             return Container(
//                               alignment: Alignment.center,
//                               color: Colors.cyan[100*(index%9)],
//                               child: Text('grid item $index'),
//                             );
//                           },
//                             childCount: 20,
//                           ),
//                         ),
//                       ),
//
//                       // 是一个所有子元素高度都为50像素的列表
//                       SliverFixedExtentList(
//                         itemExtent: 50.0,
//                         delegate: SliverChildBuilderDelegate((BuildContext context, int index){
//                           // 创建列表项
//                           return Container(
//                             alignment: Alignment.center,
//                             color: Colors.lightBlue[100*(index%9)],
//                             child: Text('list item $index'),
//                           );
//                         },
//                           // 50个列表项
//                           childCount: 50,
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
