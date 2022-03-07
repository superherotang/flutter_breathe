import 'package:get/get.dart';

import 'demo_controller.dart';

class DemoBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DemoController>(() => DemoController());
  }
}
