import 'dart:convert';
import 'package:dio/dio.dart';
import '../config/util.dart';
import 'network_error.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 网络请求 与日志拦截器
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode != 200) {
      throw DioError(
        error: NetError.excetpion(Exception.unacceptableStatusCode),
        requestOptions: response.requestOptions,
      );
    }
    if (response.data == null) {
      throw DioError(
          error: NetError.excetpion(Exception.dataNotFound),
          requestOptions: response.requestOptions);
    }
    var json = jsonDecode(response.data);
    if (json == null) {
      throw DioError(
          error: NetError.excetpion(Exception.jsonSerializationFailed),
          requestOptions: response.requestOptions);
    }
    response.data = json;
    super.onResponse(response, handler);
  }
}

class LogsInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    String? json;
    // ignore: unnecessary_null_comparison
    if (response != null) {
      json = fmt(response.data, 1);
      if (json != null) {
        json = '🇨🇳 Return Data: $json';
      } else {
        json = '🇨🇳 JSON 解析异常';
      }
    } else {
      json = '🇨🇳 response 不存在';
    }
    dynamic params;
    if (response.requestOptions.method == 'GET') {
      params = response.requestOptions.queryParameters;
    } else {
      params = response.requestOptions.data;
    }
    LogD(
        "✅ ${response.requestOptions.path} \n✅ METHOD:${response.requestOptions.method} \n✅ HEADER:${fmt(response.requestOptions.headers, 1)} \n✅ Body:${fmt(params, 1)}\n$json");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.error is NetError) {
      NetError? error = err.error as NetError;
      LogD('❌ ${error.status} ---- ${error.message}');
    } else {
      dynamic params;
      if (err.response?.requestOptions.method == 'GET') {
        params = err.response?.requestOptions.queryParameters;
      } else {
        params = err.response?.requestOptions.data;
      }
      LogD(
          "❌ ${err.response?.requestOptions.path} \n❌ METHOD:${err.response?.requestOptions.method} \n❌ HEADER:${fmt(err.response?.requestOptions.headers, 1)} \n❌ Body:${fmt(params, 1)}\n❌ ${err.response!.data}");
    }
    super.onError(err, handler);
  }
}
