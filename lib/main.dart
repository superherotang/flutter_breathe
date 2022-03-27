import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_breathe/service/location_service.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'app.dart';

import 'utils/storage.dart';

void main() async {
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
  await initStore();

  runApp(createApp());
  AssetPicker.registerObserve();
}

Future<void> initStore() async {
  // 初始化本地存储类d

  await SpUtil().init();
  // 初始化request类
  // HttpUtils.init(
  //   baseUrl: Api.baseUrl,
  // );

  //位置历史记录，全局
  await Get.putAsync(() => LocationService().init());
}
