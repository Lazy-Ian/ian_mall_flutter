/// Created by Ian on 2024/1/17
/// Email: yixin0212@qq.com
/// Function :
class ApiUrl {
  static const releaseHost = 'https://api.24th.com/';

  static const v1 = "v1";

  ///获取serviceIp
  static const getAdListUrl = "$releaseHost$v1/system/getAdList";
  static const getRecBannerUrl = "$releaseHost$v1/home/getRecBanner"; // 首页banner
  static const getRecActModel = "$releaseHost$v1/home/getRecActModel"; //  ///自定义活动 每日特惠 最新上架
  static const getHomeRecProductList = "$releaseHost$v1/home/getHomeRecProductList"; // 推荐商品列表
  static const getParentCategories = "$releaseHost$v1/category/getParentCategories"; // 分类-左侧列表

  static const getChildCategories = "$releaseHost$v1/category/getChildCategories"; // 分类-右侧列表
}
