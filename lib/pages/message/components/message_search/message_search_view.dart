import 'package:flutter/material.dart';
import 'package:flutter_hubang/pages/message/components/message_search/message_search_controller.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/widgets/clear_input.dart';
import 'package:get/get.dart';

class MessageSearchView extends GetView<MessageSearchController> {
  const MessageSearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MessageSearchController);
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: EdgeInsets.only(top: Adapt.px(20)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
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
        const Expanded(child: ClearInput()),
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: Adapt.px(30)),
            child: Text(
              "取消",
              style: TextStyle(fontSize: Adapt.px(32)),
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
        height: Adapt.px(250),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "搜索历史",
                  style: TextStyle(fontSize: Adapt.px(30)),
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
      width: Adapt.px(160),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                backgroundImage: const NetworkImage(
                    "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"),
                radius: Adapt.px(60)),
            Padding(
              padding: EdgeInsets.only(top: Adapt.px(15)),
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
