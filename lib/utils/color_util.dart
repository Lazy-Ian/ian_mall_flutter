import 'package:flutter/material.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 
class ColorUtil {
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}