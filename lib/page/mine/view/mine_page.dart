import 'package:flutter/material.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/page/mine/view_model/mine_view_model.dart';

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
    isBack = false;
  }

  @override
  Widget buildPage(BuildContext context) {
    return ProviderConsumerWidget<MineViewModel>(
      viewModel: mViewModel,
      onReady: (viewModel) {},
      isValue: true,
      builder: (BuildContext context, MineViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            MultiStateWidget(
              netState: viewModel.state.netState,
              placeHolderType: PlaceHolderType.noPlaceHolder,
              builder: (BuildContext context) {
                return CustomScrollView(
                  ///反弹效果
                  physics: const BouncingScrollPhysics(),

                  ///Sliver 家族的 Widget
                  slivers: <Widget>[
                    Image.asset("assets/images/bg_user_head_banner.jpg"),

                    ///复杂的标题
                    buildSliverAppBar(),

                    ///间距
                    const SliverPadding(
                      padding: EdgeInsets.all(5),
                    ),

                    ///九宫格
                    buildSliverGrid(),

                    ///间距
                    const SliverPadding(
                      padding: EdgeInsets.all(5),
                    ),

                    ///列表
                    buildSliverFixedExtentList()
                  ],
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
