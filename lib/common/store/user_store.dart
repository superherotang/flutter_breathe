import 'package:flutter_breathe/service/storage_service.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  var token = ''.obs;

  bool get isLogin => token.isNotEmpty;

  // UserInfoModel

  // 获取Token
  Future<void> getToken(String value) async {}
  @override
  void onInit() {
    super.onInit();
    token.value = StorageService().getString("token");
  }

  // 保存 token
  Future<void> setToken(String value) async {
    await StorageService().setString("token", value);
  }
}
