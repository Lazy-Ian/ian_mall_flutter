import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 
class AppNetImage extends StatelessWidget {
  final String imageUrl;

  final Widget? placeholder;

  final Widget? errorWidget;

  final BoxFit? fit;

  final double? width;

  final double? height;
  double? radius; //圆角
  Color? borderColor; //边框颜色

  final double? placeHolderHeight;

  AppNetImage(
      {Key? key,
        required this.imageUrl,
        this.placeholder,
        this.errorWidget,
        this.fit,
        this.width,
        this.height,
        this.placeHolderHeight,this.borderColor,this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius??0),
          border: Border.all(width: 1.w, color: borderColor ?? Colors.transparent),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) => placeholder ?? _loadingPlaceholder(),
      errorWidget: (context, url, error) =>
      errorWidget ?? _errorPlaceholder(),
      fit: fit ?? BoxFit.cover,
      width: width,
      height: height,
      fadeInDuration: const Duration(milliseconds: 1),
      fadeOutDuration: const Duration(milliseconds: 1),
    );
  }


  Widget _loadingPlaceholder(){
    return const Image(
      image: AssetImage('assets/images/p1.png'),
    );
  }

  Widget _errorPlaceholder() {
    return Container(
      width: width,
      height: height ?? 300.h,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(231, 234, 236, 1),
        borderRadius: BorderRadius.all(
          Radius.circular(5.h),
        ),
      ),
      child: Image.asset(
        "assets/images/p1.png",
        fit: BoxFit.cover,
      ),
    );
  }
}

