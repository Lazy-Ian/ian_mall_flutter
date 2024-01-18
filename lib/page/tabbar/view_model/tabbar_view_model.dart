import 'package:ian_mall_flutter/base/base_view_model.dart';

/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function : 
class TabberViewModel extends BaseViewModel {
  int selectIndex = 0;

  void changeSelectIndex(int index){
    selectIndex = index;
    notifyListeners();
  }
}
