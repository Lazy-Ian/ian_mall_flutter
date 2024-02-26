import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/multi_state_widget.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_child_model.dart';
import 'package:ian_mall_flutter/page/category/model/category_info_model.dart';
import 'package:ian_mall_flutter/page/category/view_model/category_view_page.dart';
import 'package:ian_mall_flutter/utils/device_util.dart';

/// Created by Ian on 2024/2/19
/// Email: yixin0212@qq.com
/// Function :
class CategoryPage extends BasePage {
  const CategoryPage({super.key});

  @override
  BasePageState<BasePage> getState() => _CategoryPageState();
}

class _CategoryPageState extends BasePageState<CategoryPage> {
  CategoryViewModel categoryViewModel = CategoryViewModel();
  int indexSelected = 0;
  bool isFirst = true;

  @override
  void initState() {
    super.initState();
    super.pageTitle = '分类';
    isBack = false;

  }

  @override
  Widget buildPage(BuildContext context) {
    return ProviderConsumerWidget<CategoryViewModel>(
      viewModel: categoryViewModel,
      onReady: (viewModel) {
        categoryViewModel.getParentCategories();
      },
      isValue: true,
      builder:
          (BuildContext context, CategoryViewModel viewModel, Widget? child) {
        return Stack(
          children: [
            MultiStateWidget(
              netState: viewModel.state.netState,
              placeHolderType: PlaceHolderType.noPlaceHolder,
              builder: (BuildContext context) {
                if (categoryViewModel.state.categoryInfoModel != null &&
                    categoryViewModel.state.categoryInfoModel!.isNotEmpty &&
                    isFirst) {
                  isFirst = false;
                  categoryViewModel.getChildCategories(
                      categoryViewModel.state.categoryInfoModel![0].menu_id);
                }
                return Row(
                        children: [
                          Container(
                            width: 100.w,
                            alignment: Alignment.topLeft,
                            child: MediaQuery.removePadding(
                              context: context,
                              removeTop: true,
                              child: ListView.builder(
                                shrinkWrap: true, //内容适配
                                itemCount: categoryViewModel
                                    .state.categoryInfoModel!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return _leftCategoryItems(
                                      categoryViewModel
                                          .state.categoryInfoModel![index],
                                      index);
                                },
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
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
                                  itemCount: categoryViewModel.state
                                      .categoryInfoChildModel!.cate_list!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return _rightCategoryItems(
                                        categoryViewModel
                                            .state
                                            .categoryInfoChildModel!
                                            .cate_list![index],
                                        index);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _leftCategoryItems(CategoryInfoModel item, int index) {
    return GestureDetector(
        onTap: () {
          setState(() {
            indexSelected = index;
          });
          categoryViewModel.getChildCategories(item.menu_id);
        },
        child: SizedBox(
          width: 100.w,
          height: 40.h,
          child: Row(
            children: [
              Visibility(
                visible: index == indexSelected,
                maintainState: true,
                child: Container(
                  width: 3.w,
                  color: Colors.red,
                  height: 40.h,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 0, 0), //内边距
                child: Text(item.menu_name),
              ),
            ],
          ),
        ));
  }

  Widget _rightCategoryItems(CateListModel item, int index) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.parent_name,
                style:
                    TextStyle(color: ColorConfig.textColor333, fontSize: 12.sp),
              ),
              Text(
                "热销榜",
                style: TextStyle(color: ColorConfig.mainColor, fontSize: 10.sp),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.fromLTRB(4, 4, 4, 0),
          child: StaggeredGrid.count(
            crossAxisCount: 3,
            mainAxisSpacing: 10.h,
            crossAxisSpacing: 0,
            children: item.child_list
                .map((item) => _getChildCategoryItems(item))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _getChildCategoryItems(CateListChildListModel item) {
    return GestureDetector(
        onTap: () {},
        child: SizedBox(
          child: Column(
            children: <Widget>[
              Image.network(
                width: (DeviceUtil.width(context) - 110.w) / 3,
                height: (DeviceUtil.width(context) - 110.w) / 3,
                item.category_img,
                fit: BoxFit.fitHeight,
              ),
              Text(item.category_name,
                  style: TextStyle(
                      color: ColorConfig.firstTextColor, fontSize: 12.sp)),
            ],
          ),
        ));
  }
}
