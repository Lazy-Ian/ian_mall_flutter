import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ian_mall_flutter/page/splash/view/splash_page.dart';
import 'package:ian_mall_flutter/page/tabbar/view/tabber_page.dart';
import 'package:ian_mall_flutter/routers/routers.dart';
import 'package:ian_mall_flutter/utils/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setPreferredOrientations();
  await SharedPreferencesUtil.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    Routes.initRoutes();
  }

  MaterialApp _materialApp(BuildContext context){
    String phoneNumber = SharedPreferencesUtil.sharedPreferences.getString("phoneNumber") ?? '';

    return MaterialApp(
      // home: TabbarPage(),
      home: SplashPage(),
      builder: (context, widget) {
        return MediaQuery(
          ///设置文字大小不随系统设置改变
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: FlutterEasyLoading(child: widget),
        );
      },
      navigatorKey: navigatorKey,
      locale: const Locale('zh', 'CH'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('zh', 'CH'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (BuildContext context,Widget? child) {
        return _materialApp(context);
      },
    );
  }
}

/// 强制app竖屏
void setPreferredOrientations() async {
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
