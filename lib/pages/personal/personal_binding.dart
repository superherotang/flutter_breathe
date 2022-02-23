import 'package:get/get.dart';

import 'personal_controller.dart';

class PersonalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalController>(() => PersonalController());
  }
}
