import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:get/get.dart';

class MessageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late ScrollController scrollController; //滑动
  late TabController tabController;
  late EasyRefreshController refreshcontroller;
  var count = 20.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    refreshcontroller = EasyRefreshController();
    tabController = TabController(
      vsync: this,
      length: 2,
    );
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
    refreshcontroller.dispose();
  }
}
