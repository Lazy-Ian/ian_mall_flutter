# ian_mall_flutter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# 第一步 复制接送到下面网站
 - https://caijinglong.github.io/json2dart/index.html
# 第二步 terminal 输入下面命令语句 生成.g 文件
 - flutter packages pub run build_runner build
# 第三步： lib/generated/json/base/json_convet_content.dart  中添加
- _getListChildType   中 添加对应的
- convertFuncMap 中 添加对应的 
- 
# Android 运行打包命令
flutter build apk --release
# 如果有空安全，运行打包命令
# 可选debug，release，profile
flutter build apk --no-sound-null-safety --release

# 运行打包命令
flutter build apk --release --target-platform android-arm,android-arm64,android-x64
# ios  XCode  Apple ID
flutter build ios