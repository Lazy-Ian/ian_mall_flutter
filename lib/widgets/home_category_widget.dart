import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';

import '../../../widgets/app_net_image.dart';

/// Created by Ian on 2024/1/25
/// Email: yixin0212@qq.com
/// Function :

class HomeCategoryWidget extends StatelessWidget {
  final int index;
  final Categories data;
  final bool? isStaggeredGrid;
  final Function onTap;

  const HomeCategoryWidget(
      {super.key,
      required this.index,
      required this.data,
      this.isStaggeredGrid,
      required this.onTap});

  /// 图片
  Widget imageWidget() {
    return AppNetImage(
      radius: 6.h,
      fit: BoxFit.fill,
      width: (1.sw - 30.w) / 2,
      height: 260.h,
      imageUrl: data.category_img ?? '',
    );
  }

  /// 标题
  Widget titleWidget() {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
      width: (1.sw - 30.w) / 2,
      height: 20.h,
      child: Text(
        data.category_img ?? '',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16.sp),
      ),
    );
  }

  /// 上面视图
  Widget otherWidget() {
    return Container(
      width: (1.sw - 30.w) / 2,
      height: 80.h,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1.w, color: Colors.black12),
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(6.h),
              bottomRight: Radius.circular(6.h))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleWidget(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Stack(
        children: [
          Container(
              padding: isStaggeredGrid == true
                  ? EdgeInsets.only(
                      left: index % 3 == 1 ? 10.w : 5.w,
                      right: index % 3 == 2 ? 10.w : 5.w)
                  : const EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: const Color(0xFFF3F4F8),
                borderRadius: BorderRadius.all(Radius.circular(6.h)),
              ),
              alignment: Alignment.center,
              child: Stack(
                children: [
                  imageWidget(),
                  Positioned(bottom: 0, left: 0, child: otherWidget())
                ],
              )),
        ],
      ),
    );
  }
}
