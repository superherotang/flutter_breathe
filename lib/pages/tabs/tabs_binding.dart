import 'package:flutter_hubang/pages/tabs/tabs_controller.dart';
import 'package:get/get.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabsController>(() => TabsController());
  }
}
