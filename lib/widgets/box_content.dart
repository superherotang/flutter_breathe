import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/synopsis/synopsis.dart';
import 'package:flutter_hubang/model/tag_model.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/adapt.dart';
import 'package:get/get.dart';

import 'multi_content.dart';
import 'show_box.dart';

class BoxContent extends GetView {
  final Synopsis synopsis;

  const BoxContent({
    Key? key,
    required this.synopsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: Adapt.px(20),
        ),
        ShowBox(
            likeCount: synopsis.data[0].likeCount,
            commentCount: synopsis.data[0].commentCount,
            watchCount: synopsis.data[0].watchCount,
            tagList: createTagList(),
            id: synopsis.data[0].id,
            child: MultiContent(
              text: synopsis.data[0].text,
              resource: synopsis.data[0].resource[0],
              id: synopsis.data[0].id,
              route: Routes.DETAIL,
            ))
      ],
    );
  }

  List<TagModel> createTagList() {
    List<TagModel> list = [];
    if (synopsis.data[0].resource[0].bountyList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].bountyList.length,
        tagType: TagType.bounty,
      ));
    }
    if (synopsis.data[0].resource[0].videoList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].videoList.length,
        tagType: TagType.video,
      ));
    }
    if (synopsis.data[0].resource[0].imgList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].imgList.length,
        tagType: TagType.img,
      ));
    }
    if (synopsis.data[0].resource[0].soundList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].soundList.length,
        tagType: TagType.sound,
      ));
    }

    return list;
  }
}
