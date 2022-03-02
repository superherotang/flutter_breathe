import 'package:flutter_hubang/pages/home/home_controller.dart';
import 'package:flutter_hubang/utils/location_controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LocationController>(() => LocationController());
  }
}
