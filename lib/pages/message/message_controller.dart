import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ScrollController scrollController; //滑动
  late TabController tabController;
  var count = 20.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
