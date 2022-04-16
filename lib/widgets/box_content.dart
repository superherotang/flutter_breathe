import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/posts_type.dart';
import 'package:flutter_breathe/model/synopsis/synopsis.dart';
import 'package:flutter_breathe/model/tag_model.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          height: 20.w,
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
    if (synopsis.data[0].resource[0].videoList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].videoList.length,
        postsType: PostsType.video,
      ));
    }
    if (synopsis.data[0].resource[0].imgList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].imgList.length,
        postsType: PostsType.img,
      ));
    }
    if (synopsis.data[0].resource[0].soundList.isNotEmpty) {
      list.add(TagModel(
        count: synopsis.data[0].resource[0].soundList.length,
        postsType: PostsType.sound,
      ));
    }

    return list;
  }
}
