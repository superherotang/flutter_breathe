import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/message_list_data.dart';
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
      () => CustomScrollView(slivers: [
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
                  dataMessage: "昨天",
                  profilePicture:
                      "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png"));
        }, childCount: controller.count.value))
      ]),
    );
  }
}

Future getData() async {
  await Future.delayed(Duration(milliseconds: 2000), () {});
}
