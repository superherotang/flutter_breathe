import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CityController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  var selectCity = Get.arguments["city"];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
