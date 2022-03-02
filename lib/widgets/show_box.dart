import 'package:flutter/material.dart';
import 'package:flutter_hubang/model/tag_model.dart';
import 'package:flutter_hubang/routes/app_routes.dart';
import 'package:flutter_hubang/utils/utils.dart';
import 'package:flutter_hubang/widgets/tag.dart';
import 'package:get/get.dart';

import '../utils/adapt.dart';
import 'like_button.dart';

class ShowBox extends GetView {
  final Widget child;
  final int likeCount;
  final int commentCount;
  final int watchCount;
  final List<TagModel> tagList;
  final int id;
  const ShowBox(
      {Key? key,
      required this.child,
      required this.likeCount,
      required this.commentCount,
      required this.watchCount,
      required this.tagList,
      required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        //上
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
          child: Row(
            children: [
              CircleAvatar(
                  backgroundImage: const NetworkImage(
                      "https://goss.cfp.cn/creative/vcg/800/new/VCG211165042753.jpg"),
                  radius: Adapt.px(40)),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: Adapt.px(10)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ALEC TANG",
                        style: TextStyle(
                            fontSize: Adapt.px(30),
                            fontWeight: FontWeight.w500,
                            wordSpacing: Adapt.px(2),
                            letterSpacing: Adapt.px(1)),
                      ),
                      Text("data",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: Adapt.px(26),
                              wordSpacing: Adapt.px(2),
                              letterSpacing: Adapt.px(1)))
                    ],
                  ),
                ),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.ac_unit))
            ],
          ),
        ),
        GestureDetector(
          onTap: () => Get.toNamed(Routes.DETAIL + id.toString()),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
            child: child,
          ),
        ),
        //下
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Adapt.px(5),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Adapt.px(30)),
              child: Wrap(
                  spacing: 8.0, runSpacing: 20.0, children: tagListWidget()),
            ),
            Row(
              children: [
                Expanded(
                    child: Center(
                        child: LikeButton(
                            icon: Icons.ac_unit,
                            count: Utils.intFormat(watchCount)))),
                Expanded(
                    child: Center(
                        child: LikeButton(
                            icon: Icons.ac_unit,
                            count: Utils.intFormat(commentCount)))),
                Expanded(
                    child: Center(
                        child: LikeButton(
                            icon: Icons.ac_unit,
                            count: Utils.intFormat(likeCount)))),
              ],
            ),
          ],
        ),
      ]),
    );
  }

  List<Widget> tagListWidget() {
    List<Widget> list = [];
    tagList.forEach((element) {
      list.add(Tag(tagType: element.tagType, count: element.count));
    });
    return list;
  }
}
