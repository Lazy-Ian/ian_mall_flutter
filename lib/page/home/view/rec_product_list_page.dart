import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ian_mall_flutter/config/color_config.dart';
import 'package:ian_mall_flutter/model/product_list_model.dart';
import 'package:ian_mall_flutter/page/home/model/home_rec_tab_product_list_model.dart';
import 'package:ian_mall_flutter/page/home/view_model/rec_product_list_view_model.dart';
import 'package:ian_mall_flutter/widgets/easy_loading.dart';

/// Created by Ian on 2024/2/18
/// Email: yixin0212@qq.com
/// Function :

class RecProductListPage extends StatefulWidget {
  HomeRecTabProductListModel homeRecTabProductListModel;

  RecProductListPage({super.key, required this.homeRecTabProductListModel});

  @override
  State<StatefulWidget> createState() =>
      _RecProductListPageState(homeRecTabProductListModel);
}

class _RecProductListPageState extends State<RecProductListPage> {
  RecProductListViewModel recProductViewModel = RecProductListViewModel();

  _RecProductListPageState(
      HomeRecTabProductListModel homeRecTabProductListModel) {
    recProductViewModel.state.homeRecTabProductListModel =
        homeRecTabProductListModel;
  }

  @override
  void initState() {
    print(
        '请求数据21:${recProductViewModel.state.homeRecTabProductListModel!.product_list.length}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductListModel> _product_list =
        recProductViewModel.state.homeRecTabProductListModel!.product_list;
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: MasonryGridView.count(
        // 展示几列
        crossAxisCount: 2,
        // 元素总个数
        itemCount: _product_list.length,
        // 单个子元素
        itemBuilder: (BuildContext context, int index) =>
            waterCard(_product_list[index]),
        // 纵向元素间距
        mainAxisSpacing: 10,
        // 横向元素间距
        crossAxisSpacing: 10,
        //本身不滚动，让外面的singlescrollview来滚动
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true, //收缩，让元素宽度自适应
      ),
    );
  }

  Widget waterCard(ProductListModel item) {
    return GestureDetector(
      onTap: () {
        XsEasyLoading.showToast(item.product_title);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.yellow, width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 4, 4, 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(item.product_img),
              Text(
                item.product_title,
                style:
                    TextStyle(color: ColorConfig.textColor333, fontSize: 12.sp),
              ),
              Text(
                "￥${item.newPrice}",
                style: TextStyle(color: ColorConfig.mainColor, fontSize: 14.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
