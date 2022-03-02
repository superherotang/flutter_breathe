import 'package:flutter/material.dart';
import 'package:flutter_hubang/common/color.dart';
import 'package:flutter_hubang/pages/home/home_controller.dart';
import 'package:get/get.dart';
import 'components/home_top.dart';
import 'components/recommend.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        children: tabsContent,
        controller: controller.tabController,
      ),
    );
  }
}

List<Widget> tabsContent = [
  const Material(
    child: const Recommend(),
    color: AppColor.listBackground,
  ),
  Text("111"),
  Text("111"),
  Text("111"),
  Text("111"),
  Text("111"),
];
