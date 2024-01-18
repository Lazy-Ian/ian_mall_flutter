import 'dart:convert';

import 'package:crypto/crypto.dart';

/// Created by Ian on 2024/1/18
/// Email: yixin0212@qq.com
/// Function : md5
class MD5Encryption {
  //MD5
  static String md5Crypto(String str) {
    var bytes = utf8.encode(str);
    final dig = md5.convert(bytes);
    var keyStr = dig.toString();
    // return keyStr.substring(0, 16).toLowerCase();
    return keyStr.toUpperCase();
  }
}
