import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/page/topics/model/topics_list_model.dart';
import 'package:ian_mall_flutter/page/topics/view_model/topics_view_page.dart';
import 'package:ian_mall_flutter/utils/device_util.dart';
import 'package:ian_mall_flutter/widgets/easy_loading.dart';

/// Created by Ian on 2024/2/19
/// Email: yixin0212@qq.com
/// Function :
class TopicsPage extends BasePage {
  const TopicsPage({super.key});

  @override
  BasePageState<BasePage> getState() => _TopicsPageState();
}

class _TopicsPageState extends BasePageState<TopicsPage> {
  TopicsViewModel mViewModel = TopicsViewModel();
  int indexSelected = 0;
  bool isFirst = true;
  int pageIndex = 1;

  @override
  void initState() {
    super.initState();
    super.pageTitle = '严选专题';
    isBack = false;
  }

  @override
  Widget buildPage(BuildContext context) {
    return ProviderConsumerWidget<TopicsViewModel>(
      viewModel: mViewModel,
      onReady: (viewModel) {
        mViewModel.getTopicsList(pageIndex);
      },
      isValue: true,
      builder:
          (BuildContext context, TopicsViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            MultiStateWidget(
              netState: mViewModel.state.netState,
              placeHolderType: PlaceHolderType.noPlaceHolder,
              builder: (BuildContext context) {
                return Container(
                  alignment: Alignment.topLeft,
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  //   borderRadius: BorderRadius.circular(8),
                  // ),
                  padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      shrinkWrap: true, //内容适配
                      itemCount: mViewModel.state.topicsListActModel!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _topicsItems(   mViewModel.state.topicsListActModel![index], index);
                      },
                    ),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _topicsItems(TopicsListActModel item, int index) {
    if (index == 0) {
      // 开头
      return Column(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Stack(
                  children: [
                    Image.network(item.activity_img),
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage("assets/images/ic_topic.png"),
                                fit: BoxFit.cover)),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                          child: Column(
                            children: [
                              Text(
                                item.product_count,
                                style: TextStyle(
                                    color: ColorConfig.textColorW,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '宝贝',
                                style: TextStyle(
                                    color: ColorConfig.textColorW,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: DeviceUtil.width(context),
                decoration: BoxDecoration(
                  color: ColorConfig.textColorW,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: item.list.map((item) {
                      return _topicsProductItems(item, index);
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Stack(
              children: [
                Image.network(item.activity_img),
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/ic_topic.png"),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(4, 4, 4, 8),
                      child: Column(
                        children: [
                          Text(
                            item.product_count,
                            style: TextStyle(
                                color: ColorConfig.textColorW,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '宝贝',
                            style: TextStyle(
                                color: ColorConfig.textColorW,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: DeviceUtil.width(context),
            decoration: BoxDecoration(
              color: ColorConfig.textColorW,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: item.list.map((item) {
                  return _topicsProductItems(item, index);
                }).toList(),
              ),
            ),
          ),
        ],
      );
    }
  }

  Widget _topicsProductItems(TopicsListActProductModel item, int index) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          width: (DeviceUtil.width(context) - 110.w) / 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                width: (DeviceUtil.width(context) - 110.w) / 3,
                height: (DeviceUtil.width(context) - 110.w) / 3,
                item.product_img,
                fit: BoxFit.fitHeight,
              ),
              Text(item.product_title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: ColorConfig.textColor333, fontSize: 12.sp)),
              Positioned(
                  left: 8,
                  child: Text(
                    item.newPrice,
                    style: TextStyle(
                        color: ColorConfig.mainColor, fontSize: 12.sp),
                  ))
            ],
          ),
        ));
  }
}
