import 'dart:convert';

import 'package:logger/logger.dart';
/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 
const bool inProduction = const bool.fromEnvironment("dart.vm.product");

var _logger = Logger(
    printer: PrettyPrinter(
      methodCount: 0,
      colors: true,
      lineLength: 120,
    ));

// ignore: non_constant_identifier_names
LogV(String msg) {
  _logger.v(msg);
}

LogD(String msg) {
  _logger.d(msg);
}

LogI(String msg) {
  _logger.i(msg);
}

LogW(String msg) {
  _logger.w(msg);
}

LogE(String msg) {
  _logger.e(msg);
}

LogWTF(String msg) {
  _logger.wtf(msg);
}

String? fmt(dynamic o, int lv, {String sp = ' '}) {
  JsonEncoder encoder = const JsonEncoder.withIndent('  ');
  var encoderString = "";
  try {
    encoderString = encoder.convert(o);
  } catch (e) {
    encoderString = "";
  }
  return encoderString;
}
