import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/home/home_controller.dart';
import 'package:get/get.dart';

import 'components/home_top.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController()); //重要
    return Scaffold(
      appBar: AppBar(
        title: const HomeTop(),
        bottom: TabBar(
          isScrollable: true,
          tabs: controller.myTabs,
          controller: controller.tabController,
        ),
      ),
      body: TabBarView(
        children: controller.tabsContent,
        controller: controller.tabController,
      ),
    );
  }
}
