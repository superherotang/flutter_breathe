import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/common/store/location_store.dart';
import 'package:flutter_breathe/service/storage_service.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'store/user_store.dart';

class Global {
  static Future init() async {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    WidgetsFlutterBinding.ensureInitialized();
    await SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp, // 竖屏 Portrait 模式
        DeviceOrientation.portraitDown,
        // DeviceOrientation.landscapeLeft, // 横屏 Landscape 模式
        // DeviceOrientation.landscapeRight,
      ],
    );

    // 初始化本地存储类d
    await StorageService().init();
    //初始化request类
    // HttpUtils.init(
    //   baseUrl: baseUrl,
    // );

    //位置历史记录，全局
    Get.put<LocationStore>(LocationStore());
    //用户信息
    Get.put<UserStore>(UserStore());


    AssetPicker.registerObserve();
  }
}
