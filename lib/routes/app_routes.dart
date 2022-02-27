// ignore_for_file: constant_identifier_names

import 'package:flutter_hubang/pages/Message/message_view.dart';
import 'package:flutter_hubang/pages/city/city_binding.dart';
import 'package:flutter_hubang/pages/city/city_view.dart';
import 'package:flutter_hubang/pages/home/home_binding.dart';
import 'package:flutter_hubang/pages/home/home_view.dart';
import 'package:flutter_hubang/pages/login/login_binding.dart';
import 'package:flutter_hubang/pages/login/login_view.dart';
import 'package:flutter_hubang/pages/message/components/message_search/message_search_binding.dart';
import 'package:flutter_hubang/pages/message/components/message_search/message_search_view.dart';
import 'package:flutter_hubang/pages/message/message_binding.dart';
import 'package:flutter_hubang/pages/personal/personal_binding.dart';
import 'package:flutter_hubang/pages/personal/personal_view.dart';
import 'package:flutter_hubang/pages/splash/splash_binding.dart';
import 'package:flutter_hubang/pages/splash/splash_view.dart';
import 'package:flutter_hubang/pages/tabs/tabs_binding.dart';
import 'package:flutter_hubang/pages/tabs/tabs_view.dart';
import 'package:get/get.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(name: Routes.TABS, page: () => TabsView(), binding: TabsBinding()),
    GetPage(
        name: Routes.HOME,
        page: () => const HomeView(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.Login,
        page: () => const LoginView(),
        binding: LoginBinding()),
    GetPage(
        name: Routes.MY,
        page: () => const PersonalView(),
        binding: PersonalBinding()),
    GetPage(
        name: Routes.MESSAGE,
        page: () => const MessageView(),
        binding: MessageBinding(),
        children: [
          GetPage(
              name: Routes.MESSAGESERACH,
              page: () => const MessageSearchView(),
              binding: MessageSearchBinding()),
        ]),
    GetPage(
        name: Routes.CITY,
        page: () => const CityView(),
        binding: CityBinding()),
  ];
}

abstract class Routes {
  static const INITIAL = "/";
  static const SPLASH = "/splash";
  static const TABS = "/tabs";
  static const HOME = "/home";
  static const MY = "/my";
  static const Login = "/login";
  static const MESSAGE = "/message";
  static const MESSAGESERACH = "/serach";
  static const CITY = "/city";
}
