import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:get/get.dart';

/// 检查是否登录
class RouteAuth {
  void auth(String? str) {
    if (!UserStore.to.isLogin) {
      if (str != null) {
        Get.snackbar("提示", "您未登录,请登录");
      }
      Get.toNamed(Routes.LOGIN);
    }
  }
}
