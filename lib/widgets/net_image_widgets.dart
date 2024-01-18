import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :  封装的图片显示控件

Widget AppnetImage({
  required String? url, //图片的url
  double? width, //图片宽度
  double? height, //图片高度
  BoxFit? fit = BoxFit.cover, //默认图片的拉伸方式
  double radius = 2, //默认圆角
  Color? borderColor, //默认圆角
  String? placeholder, //默认显示图
  String? errImage, //默认请求错误图
}) {
  return CachedNetworkImage(
    imageUrl: url ?? '',
    width: width,
    height: height,
    imageBuilder: (context, imageProvider) => Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius.r),
        border: Border.all(width: 1.w, color: borderColor ?? Colors.transparent),
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    ),
    placeholder: (context, url) => Padding(
      padding: EdgeInsets.all(40.w),
      child: const Image(
        image: AssetImage('assets/images/loading.gif'),
      ),
    ),
  );
}

