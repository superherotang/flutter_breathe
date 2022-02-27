import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/Message/message_view.dart';
import 'package:flutter_hubang/pages/home/home_view.dart';
import 'package:flutter_hubang/pages/personal/personal_view.dart';
import 'package:flutter_hubang/pages/tabs/tabs_controller.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/widgets/keep_alive_wrapper.dart';
import 'package:flutter_hubang/widgets/navigation.dart';
import 'package:get/get.dart';

class TabsView extends GetView<TabsController> {
  TabsView({Key? key}) : super(key: key);

  final pageItem = const [
    KeepAliveWrapper(child: HomeView()),
    KeepAliveWrapper(child: HomeView()),
    KeepAliveWrapper(child: MessageView()),
    KeepAliveWrapper(child: PersonalView()),
  ];

  final navigationBarItem = [
    NavigationItemModel(
      label: "首页",
      icon: 'assets/icon/home.svg',
    ),
    NavigationItemModel(
      label: "社区",
      icon: 'assets/icon/shequ.svg',
    ),
    NavigationItemModel(
      label: "消息",
      icon: 'assets/icon/message.svg',
      count: 1,
    ),
    NavigationItemModel(
      label: "我的",
      icon: 'assets/icon/my.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Get.put(TabsController());

    return Scaffold(
      extendBody: true, // 扩展到Scaffold的底部
      resizeToAvoidBottomInset: false, // 不允许键盘事件影响界面
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        onPageChanged: controller.onIndexChanged,
        children: pageItem,
      ),
      bottomNavigationBar: Obx(
        () => BuildNavigation(
          currentIndex: controller.tabIndex.value,
          items: navigationBarItem,
          onTap: controller.onIndexChanged, // 切换tab事件
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: Adapt.px(65)),
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.Login);
          },
          child: Icon(
            Icons.add_circle_rounded,
            size: Adapt.px(100),
          ),
        ),
      ), // 浮动按钮
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // 浮动按钮 停靠在底部中间位置
    );
  }
}
