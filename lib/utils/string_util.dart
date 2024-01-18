import 'dart:convert';

import 'package:flutter/material.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 字符串工具类
class StringUtil {
  static isEmpty(String? str) {
    return str == null || str.isEmpty;
  }

  static isNotEmpty(String? str) {
    return str != null && str.isNotEmpty;
  }

  static String urlEncode(String url, {bool encodeFull = true}) {
    if (encodeFull) {
      return Uri.encodeFull(url);
    }
    return Uri.encodeComponent(url);
  }

  static String urlDecode(String url, {bool decodeFull = true}) {
    if (decodeFull) {
      return Uri.decodeFull(url);
    }
    return Uri.decodeComponent(url);
  }

  ///空字符串整体替换
  static String emptyReplace(String? str, {String defaultValue = 'unknown'}) {
    if (isEmpty(str)) {
      return defaultValue;
    }
    return str!;
  }

  ///指定位置替换星号
  static String replaceSpecificCharacter(String str, String character, int start,
      {int end = 0, bool isEvery = false}) {
    if (StringUtil.isEmpty(str)) {
      return '';
    }
    if (end == 0) {
      end = str.length;
    }
    if (isEvery) {
      StringBuffer sb = StringBuffer();
      for (int i = 0; i < end - start; i++) {
        sb.write(character);
      }
      character = sb.toString();
    }

    return str.replaceRange(start, end, character);
  }

  static String substring(String str, int start, {int? end}) {
    return str.substring(start, end);
  }

  ///格式化银行卡号
  static String getFormatBankCard(String? card) {
    if (StringUtil.isEmpty(card)) {
      return '';
    }
    if (card!.length != 19) {
      return card;
    }

    StringBuffer sb = StringBuffer();
    sb.write(StringUtil.substring(card, 0, end: 4));
    sb.write(' ');

    sb.write(StringUtil.substring(card, 4, end: 8));
    sb.write(' ');

    sb.write(StringUtil.substring(card, 8, end: 12));
    sb.write(' ');

    sb.write(StringUtil.substring(card, 12, end: 16));
    sb.write(' ');

    sb.write(StringUtil.substring(card, 16));
    sb.write(' ');

    return sb.toString();
  }

  /// 计算字符串宽高
  static double calculateTextHeight(
      BuildContext context,
      String value,
      FontWeight fontWeight,
      fontSize,
      double maxWidth,
      int maxLines,
      ) {
    if (value.isEmpty) {
      return 0.0;
    }

    TextPainter painter = TextPainter(
      locale: Localizations.localeOf(context),
      maxLines: maxLines,
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: value,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );

    painter.layout(maxWidth: maxWidth);

    return painter.width;
  }

  /// 判断字符串是否为数字（包含正副小数点）
  bool isDecimal(String input) {
    // 正则表达式模式
    String pattern = r'^[-+]?[0-9]*\.?[0-9]+([eE][-+]?[0-9]+)?$';
    RegExp regex = RegExp(pattern);

    // 检查输入是否匹配模式
    return regex.hasMatch(input);
  }

  /// 判断字符串是否是JSON字符串
  static bool isJsonString(String jsonString) {
    try {
      json.decode(jsonString);
    } catch (e) {
      return false;
    }
    return true;
  }

  /// 判断本地文件是否为图片
  static bool isFilePicture(String filePath) {
    if (filePath.isEmpty) {
      return false;
    }
    filePath = filePath.toLowerCase();
    if (filePath.endsWith('.jpg') || filePath.endsWith('.png') || filePath.endsWith('.jpeg')) {
      return true;
    } else {
      return false;
    }
  }

  // 图片路径
  static String imagePath(String name, {String? dirName, bool ispng = true}) {
    if (!name.contains(".png") || !name.contains(".webp")) {
      name = ispng ? "$name.png" : "$name.webp";
    }
    return dirName != null ? "assets/images/$dirName/$name" : "assets/images/$name";
  }
}

