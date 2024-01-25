import 'dart:io';

import 'package:flutter/material.dart';

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

  static double width(BuildContext context){
    return  MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context){
    return  MediaQuery.of(context).size.height;
  }

  static double actionBarHeight(BuildContext context){
    return  MediaQuery.of(context).padding.top;
  }
}
