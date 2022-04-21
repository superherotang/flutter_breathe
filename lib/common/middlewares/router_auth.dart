import 'package:flutter/foundation.dart';
import 'package:flutter_breathe/common/store/user_store.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:get/get.dart';

/// 检查是否登录
class RouteAuth {
  Future<bool> auth() async {
    if (!UserStore.to.isLogin) {
      var result = await Get.toNamed(Routes.LOGIN);

      if (result != null) {
        return true;
      } else {
        return false;
      }
    }
    return true;
  }
}
