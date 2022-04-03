import 'package:flutter/material.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    builder: (context, child) {
      ScreenUtil.init(
          BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width,
              maxHeight: MediaQuery.of(context).size.height),
          designSize: const Size(750, 1334),
          context: context,
          minTextAdapt: true,
          orientation: Orientation.portrait);
      return Scaffold(
        resizeToAvoidBottomInset: false, // 不允许键盘事件影响界面
        // Global GestureDetector that will dismiss the keyboard
        body: GestureDetector(
          onTap: () {
            hideKeyboard(context);
          },
          child: child,
        ),
      );
    },
    initialRoute: Routes.TABS, //初始页面
    getPages: AppPages.pages, //路由
    theme: AppTheme.light,
  );
}

void hideKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
