import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ian_mall_flutter/routers/navigator_utils.dart';

/// Created by Ian on 2024/1/16
/// Email: yixin0212@qq.com
/// Function : 
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //要求不跳路由找不到页面，但是不配置的话会报错，所以直接pop掉
    NavigatorUtils.pop(context);
    return Container(color: Colors.transparent);
  }
}

