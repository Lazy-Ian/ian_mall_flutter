import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ian_mall_flutter/base/base_page.dart';
import 'package:ian_mall_flutter/base/provider_consumer_widget.dart';
import 'package:ian_mall_flutter/page/category/view_model/category_view_page.dart';

/// Created by Ian on 2024/2/19
/// Email: yixin0212@qq.com
/// Function :
class CategoryPage extends BasePage {
  const CategoryPage({super.key});

  @override
  BasePageState<BasePage> getState() => _CategoryPageState();
}

class _CategoryPageState extends BasePageState<CategoryPage>
    {
  CategoryViewModel categoryViewModel = CategoryViewModel();


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
        return   Wrap(
          alignment: WrapAlignment.center,
          children: [
            SizedBox(
              width: 120.w,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  shrinkWrap: true, //内容适配
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categoryViewModel.state.categoryInfoModel!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Text( categoryViewModel.state.categoryInfoModel![index].menu_name);
                  },
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
