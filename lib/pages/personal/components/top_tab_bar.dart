import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/personal/personal_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopTabBar extends GetView<PersonalController> {
  const TopTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffffffff),
      child: TabBar(
        controller: controller.tabController,
        tabs: const [
          Text("作品100"),
          Text("动态91"),
          Text("喜欢11"),
        ],
        labelStyle: TextStyle(fontSize: 40.w),
      ),
    );
  }
}
