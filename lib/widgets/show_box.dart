import 'package:flutter/material.dart';
import 'package:flutter_breathe/model/postsInfo/posts_info_model.dart';
import 'package:flutter_breathe/routes/app_routes.dart';
import 'package:flutter_breathe/widgets/multi_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'like_button.dart';

///帖子框架
class ShowBox extends GetView {
  final PostsInfoModel postsInfoModel;
  final bool? my;
  const ShowBox({
    Key? key,
    required this.postsInfoModel,
    this.my,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.w),
      child: Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          //上
          my == null
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: CircleAvatar(
                            backgroundImage: const NetworkImage(
                                "http://192.168.10.150:9000/breathe-images/1e0c25887594f25a8f57c179427b1713.png"),
                            radius: 40.w),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w),
                          child: GestureDetector(
                            onTap: () {
                              print("object");
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ALEC TANG",
                                  style: TextStyle(
                                      fontSize: 30.w,
                                      fontWeight: FontWeight.w500,
                                      wordSpacing: 2.w,
                                      overflow: TextOverflow.ellipsis,
                                      letterSpacing: 1.w),
                                ),
                                Text("昨天",
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 26.w,
                                        wordSpacing: 2.w,
                                        letterSpacing: 1.w))
                              ],
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.ac_unit))
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        Text(
                          "2020-02-01",
                          style: TextStyle(fontSize: 50.w),
                        ),
                        Expanded(child: Container()),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.ac_unit))
                      ]),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: "所属社区:  ",
                            style: TextStyle(
                                fontSize: 30.w, fontWeight: FontWeight.bold)),
                        TextSpan(
                            text: postsInfoModel.communityName,
                            style: TextStyle(
                                fontSize: 30.w,
                                color: Colors.red,
                                fontWeight: FontWeight.bold))
                      ])),
                    ],
                  ),
                ),
          GestureDetector(
            onTap: () => Get.toNamed(Routes.DETAIL + postsInfoModel.uuid,
                arguments: postsInfoModel), // + id.toString()
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: MultiContent(
                postsInfoModel: postsInfoModel,
              ),
            ),
          ),
          //下
          Padding(
            padding: EdgeInsets.only(top: 10.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.w,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 30.w),
                //   child: Wrap(
                //       spacing: 8.0, runSpacing: 20.0, children: tagListWidget()),
                // ),
                Row(
                  children: [
                    Expanded(
                        child: Center(
                            child: LikeButton(
                                icon: Icons.ac_unit,
                                count: postsInfoModel.share))),
                    Expanded(
                        child: Center(
                            child: LikeButton(
                                icon: Icons.ac_unit,
                                count: postsInfoModel.comment))),
                    Expanded(
                      child: Center(
                          child: LikeButton(
                              icon: Icons.ac_unit,
                              pid: postsInfoModel.uuid,
                              count: postsInfoModel.like)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  // List<Widget> tagListWidget() {
  //   List<Widget> list = [];
  //   tagList.forEach((element) {
  //     list.add(Tag(postsType: element.postsType, count: element.count));
  //   });
  //   return list;
  // }
}
