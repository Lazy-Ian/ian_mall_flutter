import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../routers/navigator_utils.dart';
import '../widgets/easy_loading.dart';
import 'base_state.dart';
import 'base_will_pop.dart';


/// Created by Ian on 2024/1/19
/// Email: yixin0212@qq.com
/// Function : 
abstract class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  BasePageState createState() => getState();

  ///子类实现
  BasePageState getState();

}
abstract class BasePageState<T extends BasePage> extends State<T> {

  /// 是否渲染buildPage内容
  bool _isRenderPage = false;

  /// 是否渲染导航栏
  bool isRenderHeader = true;

  /// 导航栏颜色
  Color? navColor;

  /// 左右按钮横向padding
  final EdgeInsets _btnPaddingH = EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h);

  /// 导航栏高度
  double navBarH = AppBar().preferredSize.height;

  /// 顶部状态栏高度
  double statusBarH = 0.0;

  /// 底部安全区域高度
  double bottomSafeBarH = 0.0;

  /// 页面背景色
  Color pageBgColor = const Color(0xFFF9FAFB);

  /// header显示页面title
  String pageTitle = '';
  bool isSearchView = false;

  /// 是否允许某个页iOS滑动返回，Android物理返回键返回
  bool isAllowBack = true;

  bool resizeToAvoidBottomInset = true;

  /// 是否允许点击返回上一页
  bool isBack = true;

  @override
  void initState() {
    super.initState();
    _getBarInfo();
    _addFirstFrameListener();
    print('当前类：$runtimeType');
  }

  @override
  void dispose() {
    XsEasyLoading.dismiss();
    super.dispose();
  }

  void _addFirstFrameListener() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      buildComplete();
    });
  }

  void buildComplete() {}

  /// 获取屏幕状态栏和顶部导航栏的高度
  void _getBarInfo() {
    WidgetsBinding.instance.addPostFrameCallback((mag) {
      statusBarH = ScreenUtil().statusBarHeight;
      bottomSafeBarH = ScreenUtil().bottomBarHeight;
      // if (DeviceUtil.isIOS() && ScreenUtil().bottomBarHeight > 0) {
      //   bottomSafeBarH = 14.h;
      // }
      setState(() {
        _isRenderPage = true;
      });
    });
  }

  /// 点击左边按钮
  void onTapLeft() {
    if (!isBack) return;
    NavigatorUtils.unFocus();
    NavigatorUtils.pop(context);
  }

  ///抽象header上的组件
  Widget left() {
    return Image(
      image: const AssetImage("assets/images/ic_back.png"),
      height: 20.h,
      width: 20.w,
    );
  }

  Widget right() => SizedBox(width: 20.w);

  /// 左边组件
  Widget _left() {
    return InkWell(
      onTap: onTapLeft,
      child: Container(
        padding: _btnPaddingH,
        child: left(),
      ),
    );
  }

  /// 右边组件
  Widget _right() {
    return Container(
      padding: _btnPaddingH,
      child: right(),
    );
  }

  /// 页面
  Widget _content() {
    return Container(
      color: pageBgColor,
      height: 1.sh,
      width: 1.sw,
      child: buildPage(context),
    );
  }

  ///子类实现，构建各自页面UI控件
  Widget buildPage(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      sized: false,
      value: SystemUiOverlayStyle.light,
      child: BaseWillPopPage(
        isAllowBack: isAllowBack,
        child: Scaffold(
          appBar: isRenderHeader == true
              ? AppBar(
            centerTitle: true,
            title: Text(pageTitle,
                style: TextStyle(
                    color: Colors.black, fontSize: 17.sp, fontWeight: FontWeight.w500)),
            leading: _left(),
            elevation: 0.2,
            actions: [_right()],
            backgroundColor:  navColor ?? Colors.white,
          )
              : null,
          body: _isRenderPage == false ? const SizedBox() : _content(),
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        ),
      ),
    );
  }
}
