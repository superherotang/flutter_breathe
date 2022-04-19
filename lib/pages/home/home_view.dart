import 'package:flutter/material.dart';
import 'package:flutter_breathe/common/color.dart';
import 'package:flutter_breathe/pages/home/components/community_list.dart';
import 'package:flutter_breathe/pages/home/components/follow_list.dart';
import 'package:flutter_breathe/pages/home/components/image_list.dart';
import 'package:flutter_breathe/pages/home/components/sounds_list.dart';
import 'package:flutter_breathe/pages/home/components/videos_list.dart';
import 'package:flutter_breathe/pages/home/home_controller.dart';
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
    child: Recommend(),
    color: AppColor.listBackground,
  ),
  const Material(
    child: FollowList(),
    color: AppColor.listBackground,
  ),
  const Material(
    child: CommunityList(),
    color: AppColor.listBackground,
  ),
  const Material(
    child: ImageList(),
    color: AppColor.listBackground,
  ),
  const Material(
    child: VideosList(),
    color: AppColor.listBackground,
  ),
  const Material(
    child: SoundsList(),
    color: AppColor.listBackground,
  ),
];
