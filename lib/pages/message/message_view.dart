import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/message/components/chat_list_view.dart';
import 'package:flutter_breathe/pages/message/message_controller.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/widgets/keep_alive_wrapper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/group_list_view.dart';

class MessageView extends GetView<MessageController> {
  const MessageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: messageAppBar(),
      body: TabBarView(controller: controller.tabController, children: const [
        KeepAliveWrapper(child: ChatListView()),
        KeepAliveWrapper(child: GroupListView()),
      ]),
    );
  }

  //顶部
  AppBar messageAppBar() {
    return AppBar(
        leadingWidth: double.infinity,
        leading: Padding(
          padding: EdgeInsets.only(left: 30.w, top: 25.w),
          child: Text(
            "消息",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.w),
          ),
        ),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 15.w),
              child: IconButton(
                icon: Icon(
                  Icons.search,
                  size: 60.w,
                ),
                onPressed: () {
                  Get.toNamed(Routes.MESSAGE + Routes.MESSAGESERACH);
                },
              )),
          Padding(
            padding: EdgeInsets.only(right: 25.w),
            child: Icon(
              Icons.add,
              size: 60.w,
            ),
          )
        ],
        bottom: TabBar(
          controller: controller.tabController,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 2.0,
          isScrollable: false,
          tabs: const <Tab>[Tab(text: '聊天'), Tab(text: '群组')],
        ));
  }
}
