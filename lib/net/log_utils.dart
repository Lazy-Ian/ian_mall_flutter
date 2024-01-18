import 'dart:developer';

import 'package:logger/logger.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function :
const String _tag = "LogUtils--->>>";
Logger _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 0,
  ),
);

logV(dynamic msg, {String tag = _tag}) {
  _logger.t("$msg");
}

logD(dynamic msg, {String tag = _tag}) {
  _logger.d("$msg");
}

logI(dynamic msg, {String tag = _tag}) {
  _logger.i("$msg");
}

logW(dynamic msg, {String tag = _tag}) {
  _logger.w("$msg");
}

logE(dynamic msg, {String tag = _tag}) {
  _logger.e("$msg");
}

logWTF(dynamic msg, {String tag = _tag}) {
  log(msg);
}
