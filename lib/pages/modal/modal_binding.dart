import 'package:get/get.dart';

import 'modal_controller.dart';

class ModalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ModalController>(() => ModalController());
  }
}
