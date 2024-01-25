import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/generated/l10n.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
import 'package:ian_mall_flutter/page/home/view_model/home_view_model.dart';
import 'package:ian_mall_flutter/utils/device_util.dart';
import 'package:ian_mall_flutter/utils/string_util.dart';
import 'package:image_picker/image_picker.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 首页
class HomePage extends BasePage {
  const HomePage({super.key});

  @override
  BasePageState<BasePage> getState() => _HomePageState();
}

class _HomePageState extends BasePageState<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    super.pageTitle = '首页';
    super.isRenderHeader = false;
    isBack = false;
    _onRefresh();
  }

  @override
  Widget left() {
    return const SizedBox();
  }

  /// 请求分页
  int _pageNum = 1;

  /// 上拉加载
  void _onLoading() {
    _pageNum++;
    getListData();
  }

  /// 下拉刷新
  void _onRefresh() {
    _pageNum = 1;
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
      },
      isValue: true,
      builder: (BuildContext context, HomeViewModel viewModel, Widget? child) {
        return Stack(children: [
          MultiStateWidget(
            netState: viewModel.state.netState,
            placeHolderType: PlaceHolderType.noPlaceHolder,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                controller: viewModel.scrollController,
                child: Column(
                  children: <Widget>[
                    _getBannerWidget(viewModel.state.bannerInfoBean!.banners),
                    //tag
                    _getTagWidget(viewModel.state.bannerInfoBean!.safeguards),
                    //分类
                    _getCategoryWidget(
                        viewModel.state.bannerInfoBean!.categories ?? []),
                    Container(
                      width: 200,
                      height: 300,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 200,
                      height: 300,
                      color: Colors.red,
                    ),
                  ],
                ),
              );
            },
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4),
            height: 48.h,
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
                  width: 30.w,
                  height: 30.h,
                ),
                SizedBox(
                  height: 30.h,
                  child: Text(
                    S.of(context).search_hit,
                    style: TextStyle(
                        color: ColorConfig.textColor999, fontSize: 12.sp),
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
      crossAxisCount: 5,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 0,
      children: list.map((item) => _getSafeguardsItem(item)).toList(),
    );
  }

  /// item tag
  Widget _getSafeguardsItem(Safeguards model) {
    return SizedBox(
      height: 30.h,
      child: Row(
        children: [
          Image.network(
            model.icon,
            width: 20.w,
            height: 20.h,
          ),
          Text(
            model.title,
            style: TextStyle(color: ColorConfig.textColor999, fontSize: 10.sp),
          )
        ],
      ),
    );
  }

  ///分类
  Widget _getCategoryWidget(List<Categories> list) {
    return StaggeredGrid.count(
      crossAxisCount: 5,
      mainAxisSpacing: 10.h,
      crossAxisSpacing: 0,
      children: list.map((item) => getCategoryItem(item)).toList(),
    );
  }

  ///item category
  Widget getCategoryItem(Categories model) {
    return SizedBox(
      width: (DeviceUtil.width(context) - 60.w) / 5,
      height: (DeviceUtil.width(context) - 60.w) / 5 + 20.h,
      child: Column(
        children: <Widget>[
          Image.network(
            width: (DeviceUtil.width(context) - 100.w) / 5,
            height: (DeviceUtil.width(context) - 100.w) / 5,
            model.category_img,
            fit: BoxFit.fitHeight,
          ),
          Text(model.category_name,
              style: TextStyle(
                  color: ColorConfig.firstTextColor, fontSize: 12.sp)),
        ],
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
              return Image.network(
                list[index].bannerImg,
                fit: BoxFit.fitWidth,
              );
            },
            pagination: SwiperPagination(),
            // control: SwiperControl(),
            autoplay: true,
          ),
        ),
      ],
    );
  }
}
