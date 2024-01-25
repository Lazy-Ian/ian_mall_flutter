import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:ian_mall_flutter/page/home/model/home_banner_bean.dart';
/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function : 

class SwiperWidget extends StatefulWidget {
  /// 图片数组
  List<Banners> imagesList;

  /// 宽度
  double width;

  /// 高度
  double height;

  /// 指示器对其方式
  Alignment? alignment;

  /// 指示器颜色
  Color? color;

  /// 指示器选中颜色
  Color? activeColor;

  /// 点击事件
  Function? onTap;
  /// 滚动事件
  Function? indexChangeTap;

  /// 数字背景颜色
  Color? backgroundColor;

  /// 字体大小
  double? fontSize;

  /// 字体选中大小
  double? activeFontSize;

  /// 类型 1:圆点 2:数字
  int type;

  SwiperWidget(
      {super.key,
        required this.imagesList,
        required this.width,
        required this.height,
        this.alignment,
        this.color,
        this.activeColor,
        this.onTap,
        this.backgroundColor,
        this.activeFontSize,
        this.fontSize,
        this.indexChangeTap,
        required this.type});

  @override
  State<SwiperWidget> createState() => _SwiperWidgetState();
}

class _SwiperWidgetState extends State<SwiperWidget> {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    for (int i = 0; i < widget.imagesList.length; i++) {
      widgetList.add(Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Image.network(
          widget.imagesList[i].bannerImg??'',
          fit: BoxFit.fill,
        ),
      ));
    }
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return widgetList[index];
        },
        itemCount: widget.imagesList.length,
        onTap: (int index) {
          if (widget.onTap != null) {
            widget.onTap!(index);
          }
        },
        onIndexChanged: (int index){
          if (widget.indexChangeTap != null) {
            widget.indexChangeTap!(index);
          }
        },
        autoplay: true,
        viewportFraction: 0.9,
        scale: 0.94,

        /// 自定义指示器
        // pagination: widget.type == 1
        //     ? SwiperPagination(
        //         builder: CustomSwiperPaginationBuilder(
        //             color: widget.color ?? Colors.white,
        //             activeColor: widget.activeColor ?? Colors.red,
        //             alignment: widget.alignment ?? Alignment.bottomCenter),
        //       )
        //     : SwiperPagination(
        //         alignment: Alignment.bottomRight,
        //         builder: CustomFractionPaginationBuilder(
        //             backgroundColor: widget.backgroundColor,
        //             fontSize: widget.fontSize ?? 12.sp,
        //             activeFontSize: widget.activeFontSize ?? 14.sp,
        //             color: widget.color ?? Colors.white70,
        //             activeColor: widget.activeColor ?? Colors.white)),
      ),
    );
  }
}
