import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  

  final List<Tab> myTabs = [
    const Tab(
      text: '推荐',
    ),
    const Tab(
      text: '关注的人',
    ),
    const Tab(
      text: '关注的社区',
    ),
    const Tab(
      text: '图文',
    ),
    const Tab(
      text: '视频',
    ),
    const Tab(
      text: '语音',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
