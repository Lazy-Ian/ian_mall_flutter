import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/config/util.dart';
import 'package:ian_mall_flutter/generated/l10n.dart';
import 'package:ian_mall_flutter/model/home_act_product_list_model.dart';
import 'package:ian_mall_flutter/model/product_list_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_act_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';
import 'package:ian_mall_flutter/page/home/view/rec_product_list_page.dart';
import 'package:ian_mall_flutter/page/home/view_model/home_view_model.dart';
import 'package:ian_mall_flutter/utils/device_util.dart';
import 'package:ian_mall_flutter/utils/string_util.dart';
import 'package:ian_mall_flutter/widgets/easy_loading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 首页
class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  BasePageState<BasePage> getState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> with TickerProviderStateMixin {
  HomeViewModel homeViewModel = HomeViewModel();
  final ImagePicker _picker = ImagePicker();
  double radius = 8;
  int ceragoryCrossAxisCount = 6;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    super.pageTitle = '首页';
    super.isRenderHeader = false;
    isBack = false;

    _tabController = TabController(
        vsync: this,
        initialIndex: 0,
        length: homeViewModel.state.tabProductListModel?.list.length ?? 0);

    _onRefresh();
  }

  @override
  Widget left() {
    return const SizedBox();
  }

  /// 请求分页
  int _pageIndex = 1;

  /// 上拉加载
  void _onLoading() {
    _pageIndex++;
    getListData();
  }

  /// 下拉刷新
  void _onRefresh() {
    _pageIndex = 1;
    getListData();
  }

  void getListData() {
    homeViewModel.getBannerData();
  }

  @override
  Widget buildPage(BuildContext context) {
    return ProviderConsumerWidget<HomeViewModel>(
      viewModel: homeViewModel,
      onReady: (viewModel) {
        homeViewModel.getBannerData();
        homeViewModel.getRecActModel();
        homeViewModel.getHomeRecProductListTab();
      },
      isValue: true,
      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) {
        if (_tabController.length == 0) {
          _tabController = TabController(
              length: viewModel.state.tabProductListModel!.list.length,
              vsync: this);

        ///监听TabController的动画，实时刷新，这样选中背景就能跟随移动了
        _tabController.addListener(() {
          String category_id = homeViewModel.state.tabProductListModel!
              .list[_tabController.index].category_id;
          LogE("_tabController: "+category_id);
          homeViewModel.getHomeRecProductList(category_id, _pageIndex);
        });
        }
        double statusBarHeight = MediaQuery.of(context).padding.top;

        ///轮播图高度
        double _swiperHeight = DeviceUtil.width(context) * 59 / 75 + 30.h;
        //分类 最新上架
        _swiperHeight +=
            ((DeviceUtil.width(context) - 60.w) / ceragoryCrossAxisCount +
                    10.h) *
                4;
        //自定义活动
        _swiperHeight += DeviceUtil.width(context) * 59 / 75 + 40.h;

        ///提示头部高度
        double _spikeHeight = 80;

        ///_appBarHeight算的是AppBar的bottom高度，kToolbarHeight是APPBar高，statusBarHeight是状态栏高度
        double _appBarHeight =
            _swiperHeight + _spikeHeight - kToolbarHeight - statusBarHeight;

        return Stack(children: [
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
                          preferredSize: Size.fromHeight(_appBarHeight),
                          child: Container(),
                        ),

                        ///TabBar顶部收缩的部分
                        flexibleSpace: Column(
                          children: <Widget>[
                            ///banner
                            _getBannerWidget(
                                viewModel.state.bannerInfoBean!.banners),

                            ///tag
                            _getTagWidget(
                                viewModel.state.bannerInfoBean!.safeguards),

                            ///分类
                            _getCategoryWidget(
                                viewModel.state.bannerInfoBean!.categories ??
                                    []),

                            ///活动
                            _getActivitiesWidget(
                                viewModel.state.bannerInfoBean!.activities ??
                                    []),

                            ///自定义活动 每日特惠  最新上架
                            _getRecActsModelWidget(
                                viewModel.state.actActModel?.list ?? []),
                          ],
                        ),
                      ),
                    ),

                    ///停留在顶部的TabBar
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(_tabSelection() as Stack),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  ///监听TabController的动画，实时刷新，这样选中背景就能跟随移动了
                  children: viewModel.state.tabProductListModel!.list.map((item) => _getRecProductList(item,viewModel.state.tabProductListModel!)).toList(),

                ),
              );
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
            height: 40.h,
            width: DeviceUtil.width(context),
            decoration: ShapeDecoration(
              color: ColorConfig.colorF2,
              //设置圆角
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(30)),
            ),
            margin: EdgeInsets.only(
                left: 8.h,
                right: 8.h,
                top: DeviceUtil.actionBarHeight(context)),
            child: Wrap(
              alignment: WrapAlignment.center,
              children: [
                Image.asset(
                  StringUtil.imagePath("ic_search"),
                  width: 25.w,
                  height: 25.h,
                ),
                SizedBox(
                  child: Text(
                    S.of(context).search_hit,
                    style: TextStyle(
                        height: 2.h,
                        color: ColorConfig.textColor999,
                        fontSize: 12.sp),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ]);
      },
    );
  }

  ///tag
  Widget _getTagWidget(List<Safeguards> list) {
    return StaggeredGrid.count(
      crossAxisCount: 4,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 0,
      children: list.map((item) => _getSafeguardsItem(item)).toList(),
    );
  }
  ///推荐商品列表
  Widget _getRecProductList(TabList item, HomeRecTabProductListModel model){
    return  RecProductListPage(homeRecTabProductListModel: model);
    // return Container(
    //   width: 200,
    //   height: 300,
    //   color: Colors.blueAccent,
    //   child:  Text(item.category_id + " name:" + item.category_title  + "  >>> " + model.total.toString()),
    // );
  }

  /// item tag
  Widget _getSafeguardsItem(Safeguards model) {
    return SizedBox(
      height: 30.h,
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Image.network(
              model.icon,
              width: 15.w,
              height: 15.h,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                model.title,
                style:
                    TextStyle(color: ColorConfig.textColor333, fontSize: 10.sp),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///分类
  Widget _getCategoryWidget(List<Categories> list) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
      padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
      child: StaggeredGrid.count(
        crossAxisCount: ceragoryCrossAxisCount,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 0,
        children: list.map((item) => getCategoryItem(item)).toList(),
      ),
    );
  }

  ///item category
  Widget getCategoryItem(Categories model) {
    return SizedBox(
      width: (DeviceUtil.width(context) - 60.w) / ceragoryCrossAxisCount,
      height:
          (DeviceUtil.width(context) - 60.w) / ceragoryCrossAxisCount + 20.h,
      child: GestureDetector(
        onTap: () {
          XsEasyLoading.showToast(model.category_name);
        },
        child: Column(
          children: <Widget>[
            Image.network(
              width:
                  (DeviceUtil.width(context) - 100.w) / ceragoryCrossAxisCount,
              height:
                  (DeviceUtil.width(context) - 100.w) / ceragoryCrossAxisCount,
              model.category_img,
              fit: BoxFit.fitHeight,
            ),
            Text(model.category_name,
                style: TextStyle(
                    color: ColorConfig.firstTextColor, fontSize: 12.sp)),
          ],
        ),
      ),
    );
  }

  ///banner
  Widget _getBannerWidget(List<Banners> list) {
    return Stack(
      children: [
        SizedBox(
          width: DeviceUtil.width(context),
          height: DeviceUtil.width(context) * 59 / 75,
          child: Swiper(
            itemCount: list.length,
            itemBuilder: (BuildContext content, int index) {
              return GestureDetector(
                onTap: () {
                  XsEasyLoading.showToast(list[index].bannerTitle);
                },
                child: Image.network(
                  list[index].bannerImg,
                  fit: BoxFit.fitWidth,
                ),
              );
            },
            pagination: const SwiperPagination(),
            // control: SwiperControl(),
            autoplay: true,
          ),
        ),
      ],
    );
  }

  ///活动
  Widget _getActivitiesWidget(List<Activities> list) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        shrinkWrap: true, //内容适配
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(list[index].activityImage);
        },
      ),
    );
  }

  /// 每日推荐  最新上架
  Widget _getRecActsModelWidget(List<ActModelList> list) {
    return Container(
        margin: const EdgeInsets.fromLTRB(8, 8, 0, 8),
        child: StaggeredGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.h,
          crossAxisSpacing: 0,
          children: list.map((item) => _getRecActsModelItem(item)).toList(),
        ));
  }

  /// 每日推荐  最新上架 item
  Widget _getRecActsModelItem(ActModelList item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
      child: Ink(
        child: InkWell(
          borderRadius: BorderRadius.circular(radius),
          onTap: () {
            // 处理
            XsEasyLoading.showToast(item.title);
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 4, 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: TextStyle(
                        color: ColorConfig.textColor333, fontSize: 14.sp),
                  ),
                  Text(
                    item.sub_title,
                    style: TextStyle(
                        color: ColorConfig.textColor999, fontSize: 10.sp),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.h,
                      crossAxisSpacing: 0,
                      children: item.product_list
                          .map((item) => _getRecActsModelItemImg(item))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 每日推荐  最新上架 item 图片
  Widget _getRecActsModelItemImg(HomeActProductListModel item) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
      child: Image.network(item.product_img),
    );
  }

  ///推荐商品列表
  Widget _getRecTabLayoutWidget(List<TabList> list) {
    return Column(
      children: [
        TabBar(
          tabs: list
              .map((e) => Tab(
                    text: e.category_title,
                  ))
              .toList(),
        ),
        // Expanded(
        //   child: TabBarView(
        //     children: list
        //         .map((e) => Container(
        //               child: Text(e.category_title + "的内容"),
        //             ))
        //         .toList(),
        //     // controller: _tabController,
        //   ),
        // )
      ],
    );
  }

  ///时间选择
  Widget _tabSelection() {
    double width = MediaQuery.of(context).size.width;
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        /// 固定整个布局的高，否则选中时间背景显示不全
        // Container(
        //   height: 50,
        // ),

        /// 未选中时间背景色
        // Container(
        //   height: 55 - 5.0,
        //   color: Colors.white,
        // ),
        /// 选中时间背景图片
        // Positioned(
        //   width: width / 6,
        //   height: 55,
        //
        //   ///一行有6个Tab，每次移动的距离=当前移动到的位置*单个tab的宽
        //   left: _tabController.animation!.value * width / 6,
        //   child: Container(
        //     color: ColorConfig.textColor999,
        //   ),
        // ),
        TabBar(
          isScrollable: true,
          tabAlignment: TabAlignment.start,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: ColorConfig.mainColor, width: 3),
          ),
          indicatorPadding: const EdgeInsets.only(bottom: 0),
          unselectedLabelColor: ColorConfig.textColor999,
          labelColor: ColorConfig.mainColor,
          tabs: homeViewModel.state.tabProductListModel!.list.map((item) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
              child: Column(
                children: [
                  Text(
                    item.category_title,
                    style: TextStyle(fontSize: 12.sp),
                  ),
                  Text(
                    item.category_sub_title,
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ],
              ),
            );
          }).toList(),
          controller: _tabController,
        )
      ],
    );
  }
}

///TabBar的代理
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final Stack _tabBar;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  double get maxExtent => 45;

  @override
  double get minExtent => 45;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
