import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'city_controller.dart';
import 'components/domestic.dart';
import 'components/overseas.dart';

class CityView extends GetView<CityController> {
  const CityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff8f8f8),
        appBar: AppBar(
          bottom: TabBar(
            tabs: const [Tab(text: "国内(含港澳台)"), Tab(text: "海外")],
            controller: controller.tabController,
          ),
        ),
        body: TabBarView(
          controller: controller.tabController,
          children: [Domestic(), Overseas()],
        ));
  }
}
