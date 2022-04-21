import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageController extends GetxController {
  late ScrollController scrollController; //滑动
  var count = 20.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();

  }

  @override
  void onClose() {
    super.onClose();
    scrollController.dispose();
  }
}
