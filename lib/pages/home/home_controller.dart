import 'package:flutter/material.dart';
import 'package:flutter_breathe/service/location_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  

  final List<Tab> myTabs = [
    const Tab(
      text: '推荐',
    ),
    const Tab(
      text: '赏金任务',
    ),
    const Tab(
      text: '关注的社区',
    ),
    const Tab(
      text: '关注的人',
    ),
    const Tab(
      text: '直播',
    ),
    const Tab(
      text: '信息',
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
