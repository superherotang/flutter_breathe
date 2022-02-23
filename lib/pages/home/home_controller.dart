import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late var city = "".obs;

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

  final List<Widget> tabsContent = [
    ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 80,
          color: Colors.primaries[index % Colors.primaries.length],
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: const TextStyle(color: Colors.white, fontSize: 20),
          ),
        );
      },
      itemCount: 20,
    ),
    Text("111"),
    Text("111"),
    Text("111"),
    Text("111"),
    Text("111"),
  ];

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: myTabs.length, vsync: this);
    city.value = "北京";
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
