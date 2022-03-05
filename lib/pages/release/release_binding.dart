import 'package:get/get.dart';

import 'release_controller.dart';

class ReleaseBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReleaseController>(() => ReleaseController());
  }
}
