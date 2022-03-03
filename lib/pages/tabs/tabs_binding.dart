import 'package:flutter_hubang/pages/city/city_controller.dart';
import 'package:flutter_hubang/pages/community/community_controller.dart';
import 'package:flutter_hubang/pages/home/home_controller.dart';
import 'package:flutter_hubang/pages/message/message_controller.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_hubang/pages/tabs/tabs_controller.dart';
import 'package:flutter_hubang/utils/location_controller.dart';
import 'package:get/get.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CommunityController>(() => CommunityController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<PersonalController>(() => PersonalController());
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
