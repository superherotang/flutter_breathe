import 'package:drift/drift.dart' as D;
import 'package:flutter/material.dart';
import 'package:flutter_hubang/data/db/database.dart';
import 'package:get/get.dart';
import 'package:flutter_hubang/data/db/locations/locations_dao.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;
  late var city = "".obs;
  final LocationsDao locationsDao = Get.find<LocationsDao>();

  final List<Location> locations = [];

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
  }

  @override
  void onReady() {
    super.onReady();
    getLocation();
  }

  void getLocation() async {
    try {
      var list = await locationsDao.getDescLocations();

      var aaa = await locationsDao.getAllLocations();
      if (list.isNotEmpty) {
        locations.clear();
        locations.add(list[0]);
      } else {
        //无数据 定义
        Location location = Location(city: "北京");
        locations.add(location);
        await locationsDao.insertLocation(const LocationsCompanion(
          city: D.Value('北京'),
        ));
      }
    } catch (e) {}
    if (locations[0].area == null) {
      city.value = locations[0].city;
    } else {
      city.value = locations[0].area!;
    }
    update();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
