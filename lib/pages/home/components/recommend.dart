import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/tag_model.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:flutter_hubang/widgets/multi_content.dart';
import 'package:flutter_hubang/widgets/show_box.dart';
import 'package:get/get.dart';

class Recommend extends GetView {
  const Recommend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Column(
          children: [
            SizedBox(
              height: Adapt.px(10),
            ),
            ShowBox(
                likeCount: 200000000,
                commentCount: 20,
                watchCount: 20,
                tagList: const [
                  TagModel(
                    count: 20,
                    tagType: TagType.img,
                  ),
                  TagModel(
                    count: 20,
                    tagType: TagType.bounty,
                  ),
                ],
                id: 123456,
                child: MultiContent(
                  text:
                      "在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱在线字符串随机打乱",
                  videolist: ["asasd"],
                  imglist: ["asd"],
                  bounty: Container(),
                  id: 123,
                ))
          ],
        );
      },
      itemCount: 20,
    );
  }
}
