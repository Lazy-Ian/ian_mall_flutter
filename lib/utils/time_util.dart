import 'package:ian_mall_flutter/net/log_utils.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 
class TimeUtil {

  TimeUtil._();


  ///获取毫秒时间戳
  static int currentTimeMillis() {
    return DateTime.now().millisecondsSinceEpoch * 1000;
  }
}
