import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_hubang/model/message_list_data.dart';
import 'package:flutter_hubang/widgets/loading_view.dart';
import 'package:get/get.dart';

import '../message_controller.dart';
import 'message_item.dart';
import 'top_content.dart';

class ChatListView extends GetView<MessageController> {
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return chatList();
  }

  Widget chatList() {
    return Obx(
      () => EasyRefresh.custom(
          header: PhoenixHeader(),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if (true) {
                controller.count.value = 20;
              }
            });
          },
          onLoad: () async {
            await Future.delayed(Duration(seconds: 2), () {
              if (true) {
                controller.count.value += 10;
              }
            });
          },
          slivers: [
            const SliverToBoxAdapter(
              child: TopContent(),
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate((content, index) {
              Faker faker = Faker();
              return MessageItem(
                  messageListData: MessageListData(
                      senderName: faker.person.name(),
                      message: faker.lorem.sentence(),
                      messageDate: DateTime(2019, 1, 10, 9, 30),
                      dataMessage: "asdasd",
                      profilePicture:
                          "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"));
            }, childCount: controller.count.value))
          ]),
    );
  }
}

Future getData() async {
  await Future.delayed(Duration(milliseconds: 2000), () {});
}
