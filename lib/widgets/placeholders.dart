import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 多种占位
/// 轮播图站位
class BannerPlaceholder extends StatelessWidget {
  final double? height;
  const BannerPlaceholder({Key? key, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? 200.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.0),
        color: Colors.white,
      ),
    );
  }
}

/// 文字站位
class TitlePlaceholder extends StatelessWidget {
  final double width;
  final double? height;
  const TitlePlaceholder({Key? key, required this.width, this.height}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 12.0,
      color: Colors.white,
    );
  }
}

/// GridView 站位
class GridViewPlaceHolder extends StatelessWidget {
  const GridViewPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Wrap(
              spacing: 10.w,
              runSpacing: 10.h,
              alignment: WrapAlignment.start,
              children: const [
                GridViewItemPlaceHolder(),
                GridViewItemPlaceHolder(),
                GridViewItemPlaceHolder(),
                GridViewItemPlaceHolder(),
                GridViewItemPlaceHolder(),
                GridViewItemPlaceHolder(),
              ],
            ),
          )),
    );
  }
}

/// GridView item站位
class GridViewItemPlaceHolder extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;
  const GridViewItemPlaceHolder({super.key, this.height, this.width, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (1.sw - 40.w) / 2,
      height: height ?? 220.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 6.h),
        color: Colors.white,
      ),
    );
  }
}

/// ListView 站位
class ListViewPlaceHolder extends StatelessWidget {
  const ListViewPlaceHolder({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Column(
            children: const [
              ListViewItemPlaceHolder(),
              ListViewItemPlaceHolder(),
              ListViewItemPlaceHolder(),
              ListViewItemPlaceHolder(),
              ListViewItemPlaceHolder(),
            ],
          )),
    );
  }
}

/// ListView item站位
class ListViewItemPlaceHolder extends StatelessWidget {
  const ListViewItemPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Container(
                width: (1.sw - 40.w) / 3,
                height: (1.sw - 40.w) / 3 / 3 * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: (1.sw - 40.w) / 3,
                height: (1.sw - 40.w) / 3 / 3 * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Container(
                width: (1.sw - 40.w) / 3,
                height: (1.sw - 40.w) / 3 / 3 * 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.h),
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          TitlePlaceholder(
            width: 1.sw,
          ),
          SizedBox(
            height: 10.h,
          ),
          TitlePlaceholder(
            width: 1.sw,
          ),
          SizedBox(
            height: 10.h,
          ),
        ],
      ),
    );
  }
}

/// StaggeredGridPlaceHolder
class StaggeredGridPlaceHolder extends StatelessWidget {
  const StaggeredGridPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: Column(
              children: [
                const BannerPlaceholder(),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  children: [
                    const GridViewItemPlaceHolder(),
                    SizedBox(
                      width: 10.h,
                    ),
                    const GridViewItemPlaceHolder(),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const BannerPlaceholder(),
              ],
            ),
          )),
    );
  }
}

/// StaggeredGridPlaceHolder
class DetailPlaceHolder extends StatelessWidget {
  const DetailPlaceHolder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          enabled: true,
          child: Padding(
            padding: EdgeInsets.only(left: 14.w, right: 14.w, top: 100.h),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GridViewItemPlaceHolder(height: 160.h, width: (1.sw - 80.w) / 2),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        TitlePlaceholder(
                          width: 1.sw / 2,
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TitlePlaceholder(
                          width: 1.sw / 2,
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TitlePlaceholder(
                          width: 1.sw / 2,
                          height: 20.h,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  children: [
                    GridViewItemPlaceHolder(height: 20.h, width: 40.w,borderRadius: 4.h,),
                    SizedBox(width: 10.w),
                    GridViewItemPlaceHolder(height: 20.h, width: 40.w,borderRadius: 4.h,),
                    SizedBox(width: 10.w),
                    GridViewItemPlaceHolder(height: 20.h, width: 40.w,borderRadius: 4.h,),
                    SizedBox(width: 10.w),
                    GridViewItemPlaceHolder(height: 20.h, width: 40.w,borderRadius: 4.h,),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                BannerPlaceholder(),
                SizedBox(
                  height: 10.h,
                ),
                GridViewItemPlaceHolder(height: 40.h, width: 1.sw,borderRadius: 4.h,),
                SizedBox(
                  height: 20.h,
                ),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GridViewItemPlaceHolder(height: 160.h, width: (1.sw - 80.w) / 2),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        TitlePlaceholder(
                          width: 1.sw / 2,
                          height: 30.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TitlePlaceholder(
                          width: 1.sw / 2,
                          height: 20.h,
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        TitlePlaceholder(
                          width: 1.sw / 2,
                          height: 20.h,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}

enum ContentLineType {
  twoLines,
  threeLines,
}

class ContentPlaceholder extends StatelessWidget {
  final ContentLineType lineType;

  const ContentPlaceholder({
    Key? key,
    required this.lineType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 96.0,
            height: 72.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 10.0,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8.0),
                ),
                if (lineType == ContentLineType.threeLines)
                  Container(
                    width: double.infinity,
                    height: 10.0,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                Container(
                  width: 100.0,
                  height: 10.0,
                  color: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
