import 'package:flutter_breathe/pages/community/community_controller.dart';
import 'package:flutter_breathe/pages/home/home_controller.dart';
import 'package:flutter_breathe/pages/message/message_controller.dart';
import 'package:flutter_breathe/pages/personal/personal_controller.dart';
import 'package:flutter_breathe/pages/tabs/tabs_controller.dart';
import 'package:get/get.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<CommunityController>(() => CommunityController());
    Get.lazyPut<MessageController>(() => MessageController());
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
