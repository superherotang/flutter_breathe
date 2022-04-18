import 'dart:convert';

import 'package:flutter_breathe/model/userCount/user_count_model.dart';
import 'package:flutter_breathe/model/userData/user_data_model.dart';
import 'package:flutter_breathe/service/storage_service.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();
  var token = ''.obs;
  UserDataModel? userData;
  UserCountModel? userCount;

  bool get isLogin => token.isNotEmpty;
  UserDataModel? get user => userData;

  @override
  void onInit() {
    super.onInit();
    delAll();
    token.value = StorageService().getString("token");
    String userDataStr = StorageService().getString("userData");
    if (userDataStr.isNotEmpty) {
      userData = UserDataModel.fromJson(jsonDecode(userDataStr));
    }
    String userCountStr = StorageService().getString("userCount");
    if (userCountStr.isNotEmpty) {
      userCount = UserCountModel.fromJson(jsonDecode(userCountStr));
    }
  }

  // 保存 token
  Future<void> setToken(String value) async {
    token.value = value;
    await StorageService().setString("token", value);
  }

  // 获取Token
  Future<void> getToken() async {
    token.value = StorageService().getString("token");
  }

  // 清除所有
  Future<void> delAll() async {
    await StorageService().setString("token", "");
    await StorageService().setString("userData", "");
    await StorageService().setString("userCount", "");
    token.value = '';
    userData = null;
    userCount = null;
  }

  // 保存用户信息
  Future<void> setUserData(String value) async {
    await StorageService().setString("userData", value);
  }

  // 保存用户统计信息
  Future<void> setUserCount(String value) async {
    await StorageService().setString("userCount", value);
  }

  // 更新用户信息
  Future<void> updataUser() async {
    userData = UserDataModel.fromJson(
        jsonDecode(StorageService().getString("userData")));
    userCount = UserCountModel.fromJson(
        jsonDecode(StorageService().getString("userCount")));
  }
}
