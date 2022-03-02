import 'package:get/get.dart';

import 'search_controller.dart';

class PersonalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}
