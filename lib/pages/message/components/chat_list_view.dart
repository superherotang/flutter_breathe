import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/message_list_data.dart';
import 'package:get/get.dart';

import 'message_item.dart';
import 'top_content.dart';

class ChatListView extends GetView{
  const ChatListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return chatList();
  }

  Widget chatList() {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: TopContent(),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          MessageItem(
            messageListData: MessageListData(
                senderName: "TANG",
                message: "TANG",
                messageDate: DateTime(2022, 1, 1, 1, 1),
                dataMessage: "昨天",
                profilePicture:
                    "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png",
                targetUid: 24),
          ),
          MessageItem(
              messageListData: MessageListData(
                  senderName: "ttt",
                  message: "ttt",
                  messageDate: DateTime(2022, 2, 2, 2, 2),
                  dataMessage: "昨天",
                  profilePicture:
                      "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png",
                  targetUid: 25)),
          MessageItem(
              messageListData: MessageListData(
                  senderName: "群聊",
                  message: "群聊",
                  messageDate: DateTime(2022, 3, 3, 3, 3),
                  dataMessage: "昨天",
                  profilePicture:
                      "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png",
                  targetUid: 0))
        ]))
      ],
    );
  }
}

// SliverChildBuilderDelegate((content, index) {
//             Faker faker = Faker();
//             return MessageItem(
//                 messageListData: MessageListData(
//                     senderName: faker.person.name(),
//                     message: faker.lorem.sentence(),
//                     messageDate: DateTime(2019, 1, 10, 9, 30),
//                     dataMessage: "昨天",
//                     profilePicture:
//                         "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png"));
//           }, childCount: controller.count.value),

Future getData() async {
  await Future.delayed(Duration(milliseconds: 2000), () {});
}
