import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
/// Created by Ian on 2024/1/25
/// Email: yixin0212@qq.com
/// Function : 


class LoadingFooter extends StatelessWidget {
  const LoadingFooter({Key? key}) : super(key: key);

  ///提示语
  ///
  /// [showText] 提示内容
  Widget _prompt(String showText, bool isShowLoading) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            showText,
            style: TextStyle(color: const Color(0xFF979797), fontSize: 14.sp),
          ),
          isShowLoading == true
              ? Container(
            height: 12.w,
            width: 12.w,
            margin: EdgeInsets.only(left: 8.w),
            child: const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.black26),
            ),
          )
              : const SizedBox()
        ],
      ),
    );
  }

  ///提示语和log
  ///
  /// [showText] 提示内容
  Widget _hint(String showText, {bool isShowLoading = false}) {
    return _prompt(showText,isShowLoading);
  }

  ///列表头
  CustomFooter _footer() {
    Widget body = _hint("上拉加载更多");
    return CustomFooter(
      builder: (context, mode) {
        if (mode == LoadStatus.idle) {
          body = _hint("上拉加载更多");
        } else if (mode == LoadStatus.loading) {
          body = _hint("加载中...",isShowLoading: true);
        } else if (mode == LoadStatus.failed) {
          body = _hint("加载失败");
        } else if (mode == LoadStatus.canLoading) {
          body = _hint("松手加载更多");
        } else {
          body = _hint("没有更多了～");
        }
        return body;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return _footer();
  }
}
