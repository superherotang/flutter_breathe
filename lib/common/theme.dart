import 'package:flutter/material.dart';
import 'package:flutter_hubang/utils/adapt.dart';

import 'color.dart';

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColor.scaffoldBackground,
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    primaryColor: AppColor.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: AppColor.accentColor,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: AppColor.primaryText,
      ),
      titleTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(
        color: AppColor.primaryText,
        fontWeight: FontWeight.w500,
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColor.scaffoldBackground,
      unselectedLabelStyle: TextStyle(fontSize: Adapt.px(24)),
      selectedLabelStyle:
          TextStyle(fontSize: Adapt.px(24), fontWeight: FontWeight.bold),
      unselectedItemColor: AppColor.unselectedColor,
      unselectedIconTheme: const IconThemeData(color: AppColor.unselectedColor),
      selectedIconTheme: const IconThemeData(color: AppColor.primaryColor),
      selectedItemColor: AppColor.primaryColor,
    ),
    tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColor.primaryText,
        labelStyle:
            TextStyle(fontSize: Adapt.px(36), fontWeight: FontWeight.bold),
        unselectedLabelColor: AppColor.secondaryText,
        unselectedLabelStyle: TextStyle(fontSize: Adapt.px(26))),
  );
}
