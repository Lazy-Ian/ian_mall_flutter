/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 包管理工具
class PackageUtil {
  PackageUtil._();

  static String _versionName = '';
  static String _versionCode = '88';
  static String _appName = '';
  static String _packageName = '';
  static String _buildNumber = '';

  ///Android：读取的是签名文件对应的SHA1值(去除冒号)
  static String _buildSignature = '';

  static String getVersionName() {
    _initPackage();
    return _versionName;
  }

  static String getVersionCode() {
    _initPackage();
    return _versionCode;
  }

  static Future<String> getAppName() async {
    await _initPackage();
    return _appName;
  }

  static Future<String> getPackageName() async {
    await _initPackage();
    return _packageName;
  }

  static Future<String> getBuildNumber() async {
    await _initPackage();
    return _buildNumber;
  }

  static Future<String> getBuildSignature() async {
    await _initPackage();
    return _buildSignature;
  }

  static _initPackage() async {
    if (_versionName.isEmpty) {
      // PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // _appName = "";
      // _packageName = packageInfo.packageName;
      // _versionName = packageInfo.version;
      _versionName = "4.0.4";
      // _buildNumber = packageInfo.buildNumber;
      // _buildSignature = packageInfo.buildSignature;
    }
  }
}
