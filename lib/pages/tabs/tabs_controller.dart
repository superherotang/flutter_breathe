import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsController extends GetxController {
  final PageController pageController = PageController();
  static TabsController get to => Get.find();
  var tabIndex = 0.obs;
  var modalView = true.obs;
  void onIndexChanged(int index) {
    tabIndex.value = index;
    pageController.jumpToPage(index);
  }
}
