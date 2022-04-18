import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:get/get.dart';

/// 检查是否登录
class RouteAuth {
  Future<bool> auth(String? str) async {
    if (!UserStore.to.isLogin) {
      if (str != null) {
        Get.snackbar("提示", "您未登录,请登录");
      }
      var result = await Get.toNamed(Routes.LOGIN);

      if (result!=null){
        return true;
      }
      return false;
    }
    return false;
  }
}
