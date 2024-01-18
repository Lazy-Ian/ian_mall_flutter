import 'package:flutter/cupertino.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : select 刷新 对比的是两个对象的内存地址,用这个类来解决这个问题
class SelectorPlusData<T> {
  T? _value;
  int _version = 0;
  int _lastVersion = -1;

  T? get value => _value;

  SelectorPlusData({Key? key, T? value}) {
    _value = value;
  }

  set value(T? value) {
    _version++;
    _value = value;
  }

  bool shouldRebuild() {
    bool isUpdate = _version != _lastVersion;
    if (isUpdate) {
      _lastVersion = _version;
    }
    return isUpdate;
  }
}

