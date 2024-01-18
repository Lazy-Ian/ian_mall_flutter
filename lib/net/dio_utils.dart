import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:ian_mall_flutter/model/response_model.dart';
import 'package:ian_mall_flutter/net/api_url.dart';
import 'package:ian_mall_flutter/net/log_utils.dart';
import 'package:ian_mall_flutter/utils/app_util.dart';
import 'package:ian_mall_flutter/utils/md5_encryption.dart';
import 'package:ian_mall_flutter/utils/package_util.dart';
import 'package:ian_mall_flutter/utils/time_util.dart';
import 'package:ian_mall_flutter/widgets/easy_loading.dart';
import 'package:uuid/uuid.dart';

import 'http_config.dart';
import 'network_interceptors.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function :
class DioUtils {
  Dio? _dio;

  // final cancelToken = CancelToken();

  /// 用于拼装tracId
  Uuid? uuid;
  String traceId = Platform.isAndroid ? 'Android-overseas' : 'ios-overseas';

  /// 私有构造
  DioUtils._();

  /// 实例化Http
  factory DioUtils() => _instance;

  /// 初始化配置
  static final DioUtils _instance = DioUtils._internal();


  /// 自定义Header
  final httpHeaders = {
    'version': PackageUtil.getVersionName(),
    'appVersionCode': PackageUtil.getVersionCode(),
    'channel': 'Umeng',
    'netStatus': 'WiFi',
    'Content-Type': 'application/x-www-form-urlencoded',
    'api-version': ApiUrl.v1,
    'platform': Platform.isAndroid ? 'Android' : 'iOS',
    'User-Agent': "Dalvik/2.1.0 (Linux; U; Android 12; P20S(M5A2) Build/P20S_ROW) WineKar/1.0.0",
  };

  /// 通用全局单例，第一次使用时初始化
  DioUtils._internal() {
    uuid ??= const Uuid();
    if (_dio == null) {
      uuid ??= const Uuid();
      // 初始化dio
      _dio = Dio(_options());
      // 拦截器
      _dio?.interceptors.add(_interceptors());
      _dio?.interceptors.add(LogsInterceptors());
    }
  }

  /// 获取拦截器
  InterceptorsWrapper _interceptors() {
    return InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
        appendCommonHeaders(options.headers);
        return handler.next(options);
      },
      onResponse: (Response response, ResponseInterceptorHandler handler) {
        return handler.next(response);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) {
        return handler.next(e);
      },
    );
  }

  /// 获取基础配置项
  BaseOptions _options() {
    // 获取当前环境对应的配置项
    String baseUrl = ApiUrl.serverIpUrl;
    return BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: HttpConfig.connectTimeout,
      receiveTimeout: HttpConfig.receiveTimeout,
      headers: httpHeaders,
    );
  }

  /// 给每一个请求设置唯一id
  void _setTraceId(String url) {
    if (_dio != null && uuid != null) {
      String uid = uuid!.v4();
      _dio?.options.headers['traceId'] = '$traceId-$url-$uid';
    }
  }

  /// get请求
  ///
  /// [path] 必传，请求路径
  /// [params] 非必传，请求入参
  Future<ResponseModel> _get<T>(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    _setTraceId(path);
    params = params ?? {};
    ResponseModel? responseModel;
    try {
      Response? response = await _dio?.get(path, queryParameters: params);
      var responseData = response?.data;
      responseModel = ResponseModel<T>.fromJson(responseData);
      _handleStatusCode(responseModel);
    } on DioError catch (dioError, e) {
      _handleError(dioError, e);
      if (dioError.requestOptions.cancelToken is CancelToken) {
        responseModel = ResponseModel(data: null, code: -1, message: '取消请求');
      } else {
        if (dioError.response!.data is Map) {
          responseModel = ResponseModel(
              data: null,
              code: dioError.response!.data['code'],
              message: '网络异常');
        } else {
          responseModel = ResponseModel(data: null, code: 404, message: '网络异常');
        }
      }
      if (dioError is TimeoutException) {
        responseModel = ResponseModel(data: null, code: -100, message: '网络超时');
      }
    }
    return responseModel;
  }

  static ResponseModel decode<T>(dynamic json) {
    return ResponseModel<T>.fromJson(json);
  }

  /// post请求
  ///
  /// [path] 必传，请求路径
  /// [params] 非必传，请求入参
  Future<ResponseModel> _post<T>(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    ResponseModel? responseModel;
    print(params);
    try {
      Response? response = await _dio?.post(path, data: params);
      var responseData = response?.data;
      responseModel = ResponseModel<T>.fromJson(responseData);
      _handleStatusCode(responseModel);
    } on DioError catch (dioError, e) {
      _handleError(dioError, e);
      responseModel = ResponseModel(
          data: null, code: dioError.response!.data['code'], message: '网络异常');
      if (dioError is TimeoutException) {
        responseModel = ResponseModel(data: null, code: -100, message: '网络超时');
      }
    }
    return responseModel;
  }

  /// mack数据
  ///
  /// [path] 必传|接口路径
  /// [params] 选填|接口入参
  Future<ResponseModel> _mock<T>(
    String path, {
    Map<String, dynamic>? params,
  }) async {
    ResponseModel? responseModel;
    print(params);
    try {
      var responseStr = await rootBundle.loadString(path);
      var response = json.decode(responseStr);
      var responseData = response;
      responseModel = ResponseModel<T>.fromJson(responseData);
      _handleStatusCode(responseModel);
    } catch (e) {
      responseModel =
          ResponseModel(data: null, code: -200, message: 'mack没有数据了');
    }
    return responseModel;
  }

  /// 发起请求
  /// [path] 请求链接
  /// [params] 请求参数
  /// [method] 请求方式
  Future<ResponseModel> request<T>(
    String path, {
    Map<String, dynamic>? params,
    String method = HttpConfig.post,
  }) async {
    _setTraceId(path);

    // params = params ?? {};
    params = appendCommonParams(params);
    if (method == HttpConfig.get) {
      return await _get<T>(path, params: params);
    } else if (method == HttpConfig.post) {
      return await _post<T>(path, params: params);
    } else if (method == HttpConfig.mock) {
      return await _mock<T>(path, params: params);
    } else {
      throw HttpException('request method $method is not support');
    }
  }

  void cancelRequest() {
    // cancelToken.cancel();
  }

  /// 状态码处理
  void _handleStatusCode(ResponseModel? responseModel) {
    if (responseModel?.code == null) return;
    switch (responseModel?.code) {
      /// token失效
      case 1001:

        /// 退出登录
        break;
      default:
        break;
    }
  }

  /// dio异常处理
  void _handleError(DioError error, e) {
    debugPrintStack(
        stackTrace: error.stackTrace,
        label: '--------------- HTTP ERROR ----------------');
    XsEasyLoading.showToast('网络异常');
  }

  /// 向header添加动态公参
  void appendCommonHeaders(Map<String, dynamic> headers) {
    headers['userToken'] =  AppUtil.getToken(); //登录的token
    headers['appKey'] = AppUtil.getAppKey();
  }

  /// 向参数中追加公共参数
  Map<String, dynamic> appendCommonParams(Map<String, dynamic>? params) {
    params ??= <String, dynamic>{};
    String accessRandom = AppUtil.getRandom(8); //随机数
    String timestamp = TimeUtil.currentTimeMillis().toString(); //时间戳
    var accessSign = ""; //签名
 //version=4.0.4&
    // userToken=&
    // platform=Android&
    // timestamp=1705540699&
    // appKey=AnFj__yH3Xhdwg56liP0TVp5LfihYm9eHU3GQGs5rCAM&
    // accessRandom=19978756
    /// 追加功能参数
    params?['version'] = PackageUtil.getVersionName();
    params?['userToken'] = AppUtil.getToken(); //登录的token
    params?['platform'] = "Android"; //平台
    params?['timestamp'] = timestamp; //时间戳
    params?['appKey'] = AppUtil.getAppKey();
    params?['accessRandom'] = accessRandom; //随机数
     accessSign = getSignInfo(params);
    if (_dio != null) {
      _dio?.options.headers['accessSign'] = accessSign; //签名
      _dio?.options.headers['accessRandom'] = accessRandom; //随机数
      _dio?.options.headers['timestamp'] = timestamp; //时间戳
    }
    return params!;
  }

  String getSignInfo(Map<String, dynamic> params) {
    //1.所有请求参数按照字母先后顺序排列
    final sortedKeysAsc = SplayTreeMap.from(params);
    sortedKeysAsc["appKeySecret"] = AppUtil.INIT_KEY + AppUtil.INIT_KEY;
    logE(sortedKeysAsc);

    //2.把所有参数名和参数值进行拼装
   String sortMap = sortedKeysAsc.toString().replaceAll("{", "").replaceAll("}", "")
        .replaceAll("=", "").replaceAll(":", "").replaceAll(",", "")
        .replaceAll(" ", "").replaceAll("+", "").replaceAll("/", "");
    logE(sortMap);
    //3.使用MD5进行加密，再转化成大写

    return MD5Encryption.md5Crypto(sortMap);
  }
}
