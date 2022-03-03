import 'package:get/get.dart';

import 'chome_controller.dart';

class ChomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChomeController>(() => ChomeController());
  }
}
