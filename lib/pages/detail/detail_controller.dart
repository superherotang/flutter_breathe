import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void onInit() {
    super.onInit();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  void onClose() {
    super.onClose();
    tabController.dispose();
  }
}
