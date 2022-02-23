import 'package:flutter/material.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:get/get.dart';

import 'common/index.dart';
import 'common/lang/translation_service.dart';

Widget createApp() {
  return GetMaterialApp(
    title: '虎帮',
    translations: TranslationService(), //国际化词
    debugShowCheckedModeBanner: false,
    locale: Get.deviceLocale, //跟随系统语言
    fallbackLocale: const Locale('zh', 'CN'), //配置错误的情况
    initialRoute: Routes.TABS, //初始页面
    getPages: AppPages.pages, //路由
    theme: AppTheme.light,
  );
}
