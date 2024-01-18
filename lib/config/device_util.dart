import 'dart:io';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function :
class DeviceUtil {
  static String getSystemName() {
    return Platform.operatingSystem;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }

  static bool isIOS() {
    return Platform.isIOS;
  }
}
