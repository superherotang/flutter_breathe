import 'package:get/get.dart';

import 'city_controller.dart';

class CityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CityController>(() => CityController());
  }
}
