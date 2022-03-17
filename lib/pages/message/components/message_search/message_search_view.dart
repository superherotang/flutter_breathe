import 'package:flutter/material.dart';
import 'package:flutter_breathe/pages/message/components/message_search/message_search_controller.dart';
import 'package:flutter_breathe/widgets/search_input.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MessageSearchView extends GetView<MessageSearchController> {
  const MessageSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MessageSearchController);
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: 20.w),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Column(
            children: [searchInput(), history()],
          ),
        ),
      )),
    );
  }

  Widget searchInput() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: SearchInput()),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: Text(
              "取消",
              style: TextStyle(fontSize: 32.w),
            ),
          ),
        )
      ],
    );
  }

  Widget history() {
    return Card(
      elevation: 0,
      child: SizedBox(
        height: 250.w,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "搜索历史",
                  style: TextStyle(fontSize: 30.w),
                ),
                Expanded(
                    child: Container(
                        alignment: Alignment.centerRight,
                        child: InkWell(onTap: () {}, child: const Text("清空"))))
              ],
            ),
            Expanded(
                child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return storyCard();
              },
              itemCount: 10,
            ))
          ],
        ),
      ),
    );
  }

  Widget storyCard() {
    return SizedBox(
      width: 160.w,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                backgroundImage: const NetworkImage(
                    "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"),
                radius: 60.w),
            Padding(
              padding: EdgeInsets.only(top: 15.w),
              child: const Text(
                "阿松大阿松大",
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
