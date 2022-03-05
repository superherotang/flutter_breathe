import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/message_list_data.dart';
import 'package:flutter_hubang/pages/message/message_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageItem extends GetView<MessageController> {
  const MessageItem({Key? key, required this.messageListData})
      : super(key: key);
  final MessageListData messageListData;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.w,
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: CircleAvatar(
                backgroundImage: NetworkImage(messageListData.profilePicture),
                radius: 50.w),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Text(
                  messageListData.senderName,
                  style: TextStyle(
                      letterSpacing: 1.w,
                      wordSpacing: 3.w,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                  height: 40.w,
                  child: Text(
                    messageListData.message,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 26.w, color: Colors.grey[700]),
                  )),
            ],
          )),
          Padding(
            padding: EdgeInsets.only(right: 30.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 10.w,
                ),
                Text(
                  messageListData.dataMessage.toUpperCase(),
                  style: TextStyle(
                      fontSize: 20.w,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[700]),
                ),
                SizedBox(
                  height: 15.w,
                ),
                Container(
                  width: 35.w,
                  height: 35.w,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.blue),
                  child: Center(
                    child: Text(
                      "1",
                      style: TextStyle(fontSize: 20.w, color: Colors.white),
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
