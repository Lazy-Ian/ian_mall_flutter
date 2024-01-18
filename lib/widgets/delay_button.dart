import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 
class DelayButton extends StatelessWidget {
  /// 按钮宽度
  final double width;

  /// 按钮高度
  final double height;

  /// 子视图
  final Widget mainWidget;

  /// 事件
  final VoidCallback onTap;

  /// 外形修饰
  final BoxDecoration? decoration;

  /// 外边距
  final EdgeInsetsGeometry? margin;

  /// 内边距
  final EdgeInsetsGeometry? padding;

  /// 排列方式
  final Alignment? alignment;

  /// 延时时间 单位秒 默认两秒
  final int? clickSpaceTime;

  const DelayButton(
      {Key? key,
        required this.width,
        required this.height,
        required this.onTap,
        this.decoration,
        this.margin,
        this.padding,
        required this.mainWidget,
        this.alignment,
        this.clickSpaceTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool bCanPress = true;
    int time = 0;
    if (clickSpaceTime == null) {
      time = 2000;
    } else {
      time = (clickSpaceTime ?? 0) * 1000;
    }
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Container(
        alignment: alignment,
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: decoration,
        child: mainWidget,
      ),
      onTap: () {
        /// 避免重复响应
        if (bCanPress) {
          bCanPress = false;
          onTap();
          Future.delayed(Duration(milliseconds: time), () {
            bCanPress = true;
          });
        } else {
          if (kDebugMode) {
            print('按钮重复点击');
          }
        }
      },
    );
  }
}

