import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/Message/message_view.dart';
import 'package:flutter_breathe/pages/community/community_view.dart';
import 'package:flutter_breathe/pages/home/home_view.dart';
import 'package:flutter_breathe/pages/personal/personal_view.dart';
import 'package:flutter_breathe/pages/tabs/tabs_controller.dart';
import 'package:flutter_breathe/widgets/keep_alive_wrapper.dart';
import 'package:flutter_breathe/widgets/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/modal_view.dart';

class TabsView extends GetView<TabsController> {
  TabsView({Key? key}) : super(key: key);

  final pageItem = const [
    KeepAliveWrapper(child: HomeView()),
    KeepAliveWrapper(child: CommunityView()),
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
    return Stack(
      children: [
        Scaffold(
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
            margin: EdgeInsets.only(top: 70.w),
            child: FloatingActionButton(
              onPressed: () async {
                // if (await RouteAuth().auth()) {
                //   Get.to(() => const ModalView());
                // }
                Get.to(() => const ModalView());
              },
              child: Icon(
                Icons.add_circle_rounded,
                size: 100.w,
              ),
            ),
          ), // 浮动按钮
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked, // 浮动按钮 停靠在底部中间位置
        ),
        Obx(
          () => Offstage(
            offstage: controller.modalView.value,
            child: const ModalView(),
          ),
        )
      ],
    );
  }
}
