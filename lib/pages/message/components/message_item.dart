import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/message_list_data.dart';
import 'package:flutter_hubang/pages/message/message_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

class MessageItem extends GetView<MessageController> {
  const MessageItem({Key? key, required this.messageListData})
      : super(key: key);
  final MessageListData messageListData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Adapt.px(150),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(Adapt.px(20)),
            child: CircleAvatar(
                backgroundImage: NetworkImage(messageListData.profilePicture),
                radius: Adapt.px(50)),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: Adapt.px(10)),
                child: Text(
                  messageListData.senderName,
                  style: TextStyle(
                      letterSpacing: Adapt.px(1),
                      wordSpacing: Adapt.px(3),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height: Adapt.px(40),
                  child: Text(
                    messageListData.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontSize: Adapt.px(26), color: Colors.grey[700]),
                  )),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(right: Adapt.px(30)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: Adapt.px(10),
                ),
                Text(
                  messageListData.dataMessage.toUpperCase(),
                  style: TextStyle(
                      fontSize: Adapt.px(20),
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: Adapt.px(15),
                ),
                Container(
                  width: Adapt.px(35),
                  height: Adapt.px(35),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(
                          fontSize: Adapt.px(20), color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
