// ignore_for_file: constant_identifier_names

import 'package:flutter_breathe/pages/chome/chome_binding.dart';
import 'package:flutter_breathe/pages/chome/chome_view.dart';
import 'package:flutter_breathe/pages/city/city_binding.dart';
import 'package:flutter_breathe/pages/city/city_view.dart';
import 'package:flutter_breathe/pages/community/community_binding.dart';
import 'package:flutter_breathe/pages/community/community_view.dart';
import 'package:flutter_breathe/pages/demo/demo_binding.dart';
import 'package:flutter_breathe/pages/demo/demo_view.dart';
import 'package:flutter_breathe/pages/detail/detail_binding.dart';
import 'package:flutter_breathe/pages/detail/detail_view.dart';
import 'package:flutter_breathe/pages/home/home_binding.dart';
import 'package:flutter_breathe/pages/home/home_view.dart';
import 'package:flutter_breathe/pages/login/login_binding.dart';
import 'package:flutter_breathe/pages/login/login_view.dart';
import 'package:flutter_breathe/pages/message/components/message_search/message_search_binding.dart';
import 'package:flutter_breathe/pages/message/components/message_search/message_search_view.dart';
import 'package:flutter_breathe/pages/message/message_binding.dart';
import 'package:flutter_breathe/pages/message/message_view.dart';
import 'package:flutter_breathe/pages/personal/personal_binding.dart';
import 'package:flutter_breathe/pages/personal/personal_view.dart';
import 'package:flutter_breathe/pages/release/release_binding.dart';
import 'package:flutter_breathe/pages/release/release_view.dart';
import 'package:flutter_breathe/pages/splash/splash_binding.dart';
import 'package:flutter_breathe/pages/splash/splash_view.dart';
import 'package:flutter_breathe/pages/tabs/tabs_binding.dart';
import 'package:flutter_breathe/pages/tabs/tabs_view.dart';
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
      binding: LoginBinding(),
    ),
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
    GetPage(
        name: Routes.DETAILID,
        page: () => const DetailView(),
        binding: DetailBinding()),
    GetPage(
        name: Routes.COMMUNITY,
        page: () => const CommunityView(),
        binding: CommunityBinding()),
    GetPage(
        name: Routes.CHOMEID,
        page: () => const ChomeView(),
        binding: ChomeBinding()),
    GetPage(
        name: Routes.RELEASE,
        page: () => const ReleaseView(),
        binding: ReleaseBinding()),
    GetPage(
        name: Routes.DEMO,
        page: () => const DemoView(),
        binding: DemoBinding()),
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
  static const MESSAGESERACH = "/messageserach";
  static const CITY = "/city";
  static const DETAIL = "/detail/";
  static const DETAILID = "/detail/:id";
  static const COMMUNITY = "/community";
  static const SERACH = "/serach";
  static const CHOME = "/chome/";
  static const CHOMEID = "/chome/:id";
  static const RELEASE = "/release";
  static const DEMO = "/demo";
}
