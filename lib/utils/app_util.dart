import 'dart:io';
import 'dart:math';

import 'package:ian_mall_flutter/net/log_utils.dart';
import 'package:ian_mall_flutter/utils/shared_preferences.dart';
import 'package:uuid/uuid.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : app 管理工具
class AppUtil {
  AppUtil._();

  static bool ISDEBUG = false;

  static String INIT_KEY = ISDEBUG ? INIT_KEY_TEST : INIT_KEY_OFFICIAL;

  /// 正式版本的    secret_key
  static String INIT_KEY_OFFICIAL = "y2p26dc7";

  ///测试
  static String INIT_KEY_TEST = "y2p26dc7";

  //随机数
  static String getRandom(int count) {
    String random = "";
    for (int i = 0; i < count; i++) {
      random += Random().nextInt(10).toString();
    }

    // logI("random=" + random);
    return random;
  }

  static String getPlatform() {
    if (Platform.isAndroid) {
      return "Android";
    } else if (Platform.isIOS) {
      return "IOS";
    } else {
      return "web";
    }
  }

  static String getAppKey() {
    String appKey = "";
    if (SharedPreferencesUtil.getString("deviceToken").toString().isNotEmpty) {
      appKey = SharedPreferencesUtil.getString("deviceToken").toString();
    } else {
      appKey = const Uuid().v5(Uuid.NAMESPACE_NIL, "24th.com");
      // appKey = Uuid.NAMESPACE_NIL;
    }
    // return appKey;
    return "AnFj__yH3Xhdwg56liP0TVp5LfihYm9eHU3GQGs5rCAM";
  }

  static String getToken() {
    String token = "";
    if (SharedPreferencesUtil.getString("token").toString().isNotEmpty) {
      token = SharedPreferencesUtil.getString("token").toString();
    }
    return token;
  }
}
